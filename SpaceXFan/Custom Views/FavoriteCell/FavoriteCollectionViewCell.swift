//
//  FavoriteCollectionViewCell.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 5.06.2022.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: FavoriteCollectionViewCell.self)

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!
    
    func setupFavorite(_ rocket: Favorite) {
        nameLbl.text = rocket.rocketName
        if rocket.defaultImageLinks != nil && rocket.defaultImageLinks.count > 0 {
            downloadImages(imageUrls: [rocket.defaultImageLinks.first!]) { (images) in
                self.rocketImage.image = images.first as? UIImage
            }
        }
    }
}
