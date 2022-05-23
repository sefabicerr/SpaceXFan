//
//  String+Extension.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}


