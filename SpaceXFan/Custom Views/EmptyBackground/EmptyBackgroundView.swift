//
//  EmptyBackgroundView.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 25.05.2022.
//

import UIKit

class EmptyBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("EmptyBackgroundView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
}
