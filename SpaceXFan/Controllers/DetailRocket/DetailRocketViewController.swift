//
//  DetailRocketViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit

class DetailRocketViewController: UIViewController {

    @IBOutlet weak var colectionView: UICollectionView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var diameterLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var enginesType: UILabel!
    @IBOutlet weak var firstFlightLbl: UILabel!
    
    
    
    
    
    var imageList = [String]()
    var imageList2 = [UIImage]()
    var rocket : Rocket?
    var isImageClick = false
    let d = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        setupUIInfo()
        createGestureRecognizer()
        getFavorite()
        
        self.view.backgroundColor = .darkGray
        //print(imageListCell.count)
    }
    
    //MARK: -For fav image
    private func createGestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage(tapGestureRecognizer:)))
        favImage.isUserInteractionEnabled = true
        favImage.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changeImage(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if isImageClick {
            deleteFavorite()
            isImageClick = false
            tappedImage.image = UIImage(named: "buttonsIconsFavoritesEnable")
            
        } else {
            saveToFirebase()
            isImageClick = true
            tappedImage.image = UIImage(named: "buttonsIconsFavoritesActivePressed")
        }
    }
    
    //MARK: - RegisterCell
    private func registerCells() {
        colectionView.register(UINib(nibName: DetailCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
     }
    
    private func setupUIInfo () {
        if let rocket = rocket {
            self.navigationItem.title = rocket.name
            descriptionText.text = rocket.welcomeDescription
            heightLbl.text = "\(rocket.height.meters!) m / \(rocket.height.feet!) ft"
            diameterLbl.text = "\(rocket.diameter.meters!) m / \(rocket.diameter.feet!) ft"
            massLbl.text = "\(rocket.mass.kg)/\(rocket.mass.lb) lb"
            enginesType.text = rocket.engines.type
            firstFlightLbl.text = rocket.firstFlight
            imageList = rocket.flickrImages
        }
    }
    
    //MARK: To save favorite food in firebase
    private func saveToFirebase() {
        
        if let rocket = rocket {
            print("\(rocket.id)")
            let fav = Favorite(rocketId: rocket.id, userId: User.currentId(), rocketName: rocket.name, description: rocket.welcomeDescription, height: "\(rocket.height)", diameter: "\(rocket.diameter)", mass: "\(rocket.mass)", enginesType: rocket.engines.type, firstFlight: rocket.firstFlight, imageLink: rocket.flickrImages)
            
                saveFavoriteToFirebase(favorite: fav)
                self.d.set(fav.favId, forKey: fav.rocketId)
        }
    }
    
    private func deleteFavorite(){
        let favoriteId = d.string(forKey: rocket!.id)
        deleteToFirebase(with: favoriteId!)
        d.removeObject(forKey: rocket!.id)
    }
    
    private func getFavorite() {
        let favoriteId = d.string(forKey: rocket!.id)
        
        if favoriteId != nil {
            downloadItemsWithIdFromFirebase(with: User.currentId(), with: favoriteId!) { (response) in
                print(response)
                self.isImageClick = response
                self.favImage.image = UIImage(named: "buttonsIconsFavoritesActivePressed")
                print(self.isImageClick)
            }
        }
    }
    
    

}

extension DetailRocketViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = imageList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as! DetailCollectionViewCell
        cell.setup(index: indexPath.row, image)
        return cell
    }
    
}
