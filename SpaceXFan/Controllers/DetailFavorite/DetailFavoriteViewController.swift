//
//  DetailFavoriteViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 24.05.2022.
//

import UIKit

class DetailFavoriteViewController: UIViewController {

    //MARK: - IBOutlets
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
    var favorite: Favorite?
    var imageList = [String]()
    let d = UserDefaults.standard
    var isImageClick = true
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUIInfo()
        registerCells()
        
    }
        
    @IBAction func favBtnClicked(_ sender: Any) {
        deleteFavorite()
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - For setup ui infos
    private func setupUIInfo () {
        if let favorite = favorite {
            self.navigationItem.title = favorite.rocketName
            descriptionText.text = favorite.description
            heightLbl.text = favorite.height
            diameterLbl.text = favorite.diameter
            massLbl.text = favorite.mass
            enginesType.text = favorite.enginesType
            firstFlightLbl.text = favorite.firstFlight
            imageList = favorite.imageLink
            
            if favorite.defaultImageLinks.count > 0 {
                downloadImages(imageUrls: [favorite.defaultImageLinks.first!]) { (images) in
                    self.headerImage.image = images.first as? UIImage
                }
            }
        }
    }
    
    //MARK: - Delete favorite from firebase
    private func deleteFavorite(){
        let favoriteId = d.string(forKey: favorite!.rocketId)
        deleteToFirebase(with: favoriteId!)
        d.removeObject(forKey: favorite!.rocketId)
    }
    
    //MARK: - RegisterCell
    private func registerCells() {
        colectionView.register(UINib(nibName: DetailCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
     }
}

extension DetailFavoriteViewController: UICollectionViewDelegate,UICollectionViewDataSource {
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
