//
//  DetailRocketViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit

class DetailRocketViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var colectionView: UICollectionView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var diameterLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var enginesType: UILabel!
    @IBOutlet weak var firstFlightLbl: UILabel!
    
    //MARK: - Vars
    var imageList = [String]()
    var defaultImageList = [UIImage]()
    var rocket : Rocket?
    var image = UIImage()
    var isImageClick = false
    let d = UserDefaults.standard
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        setupUIInfo()
        createGestureRecognizer()
        getFavorite()
        
        self.view.backgroundColor = .darkGray
        headerImage.image = image
        defaultImageList.append(image)
    }
    
    //MARK: -For fav image clicked
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
            let docId = FirebaseReference(.Favorite).document().documentID
            let fav = Favorite(favId: docId,rocketId: rocket.id, userId: User.currentId(), rocketName: rocket.name, description: rocket.welcomeDescription, height: "\(rocket.height.meters!) m / \(rocket.height.feet!) ft", diameter: "\(rocket.diameter.meters!) m / \(rocket.diameter.feet!) ft", mass: "\(rocket.mass.kg)/\(rocket.mass.lb) lb", enginesType: rocket.engines.type, firstFlight: rocket.firstFlight, imageLink: rocket.flickrImages)
            
            if defaultImageList.count > 0 {
                uploadImages(images: defaultImageList, itemId: fav.favId!) { imageLinkArray in
                    fav.defaultImageLinks = imageLinkArray
                    saveFavoriteToFirebase(favorite: fav)
                    self.d.set(fav.favId, forKey: fav.rocketId)
                }
            } else {
                saveFavoriteToFirebase(favorite: fav)
            }
        }
    }
    
    //MARK: - Delete favorite from firebase
    private func deleteFavorite(){
        let favoriteId = d.string(forKey: rocket!.id)
        deleteToFirebase(with: favoriteId!)
        d.removeObject(forKey: rocket!.id)
    }
    
    //MARK: - get all favorite rocket
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
        cell.setup(image)
        return cell
    }
    
}
