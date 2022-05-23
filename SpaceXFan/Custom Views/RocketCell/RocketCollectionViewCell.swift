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
    

}
