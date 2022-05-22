//
//  ProgressBarProtocol.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit
import FlexibleSteppedProgressBar

protocol ProgressBarProtocol {
    func createProgressBar(_ progressBar: FlexibleSteppedProgressBar)
        
}

extension ProgressBarProtocol where Self: ProgressBarProtocol & UIViewController {
    func createProgressBar(_ progressBar: FlexibleSteppedProgressBar){
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressBar)

        let horizontalConstraint = progressBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = progressBar.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: 110
        )
        let widthConstraint = progressBar.widthAnchor.constraint(equalToConstant: 340)
        let heightConstraint = progressBar.heightAnchor.constraint(equalToConstant: 18)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

        progressBar.numberOfPoints = 4
        progressBar.lineHeight = 9
        progressBar.radius = 15
        progressBar.progressRadius = 25
        progressBar.progressLineHeight = 3
        progressBar.delegate = self as? FlexibleSteppedProgressBarDelegate
        progressBar.selectedBackgoundColor = .cyan
        progressBar.currentSelectedCenterColor = .cyan
        progressBar.selectedOuterCircleStrokeColor = .clear
        progressBar.centerLayerDarkBackgroundTextColor = .white
    }
}
