//
//  UIView+Extension.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
         get{ return self.cornerRadius }
         set{
             self.layer.cornerRadius = newValue
         }
     }
}

