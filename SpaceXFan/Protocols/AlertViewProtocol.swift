//
//  AlertViewProtocol.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit

//MARK: - Create alert protocol and extension for all alert in app. 
typealias AlertActionHandler = (UIAlertAction) -> Void
protocol AlertProtocol {
    func alertMessage(titleInput: String, messageInput: String, doneAction: AlertActionHandler?)
}

extension AlertProtocol where Self: AlertProtocol & UIViewController {
    func alertMessage(titleInput: String = "", messageInput: String = "", doneAction: AlertActionHandler? = nil) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.view.tintColor = UIColor(named: "appColor")
        let okButton = UIAlertAction(title: "Tamam", style: .default, handler: doneAction)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

