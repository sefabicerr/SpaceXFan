//
//  DetailCollectionViewCell.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit
import Kingfisher


class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DetailCollectionViewCell.self)

    @IBOutlet weak var imageView: UIImageView!
    
    func setup(_ imageLink: String) {
        imageView.kf.setImage(with: imageLink.asUrl)
    }
    
}
