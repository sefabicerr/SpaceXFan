//
//  BackgroundImageProtocol.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit

protocol BackgroundImageProtocol {
    func createBackground(_ image: UIImage, _ imageView: UIImageView)
}

extension BackgroundImageProtocol where Self: BackgroundImageProtocol & UIViewController {
    func createBackground(_ image: UIImage, _ imageView: UIImageView) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 1
        self.view.insertSubview(imageView, at: 0)
    }
}
