//
//  RocketsViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit
import FirebaseAuth

class RocketsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    

    @IBAction func logOutClicked(_ sender: Any) {
        logOut()
    }

    //MARK: - For logout request func
    private func logOut() {
        do{
            try Auth.auth().signOut()
            let controller = storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .partialCurl
            present(controller, animated: true, completion: nil)
        } catch{
            print(error.localizedDescription)
        }
    }

}
