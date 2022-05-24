//
//  RocketCollectionViewCell.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: RocketCollectionViewCell.self)
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!

    func setup(_ rocket: Rocket) {
        nameLbl.text = rocket.name
        //rocketImage.kf.setImage(with: rocket.flickrImages[0].asUrl)
    }
    
    func setupFavorite(_ rocket: Favorite) {
        nameLbl.text = rocket.rocketName
        if rocket.defaultImageLinks != nil && rocket.defaultImageLinks.count > 0 {
            downloadImages(imageUrls: [rocket.defaultImageLinks.first!]) { (images) in
                self.rocketImage.image = images.first as? UIImage
            }
        }
    }
    

}
