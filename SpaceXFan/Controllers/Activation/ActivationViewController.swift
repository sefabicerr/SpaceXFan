//
//  ActivationViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit
import FlexibleSteppedProgressBar

class ActivationViewController: UIViewController,ProgressBarProtocol,BackgroundImageProtocol,AlertProtocol {

    
    //MARK: - Vars
    var progressBar: FlexibleSteppedProgressBar! {
        didSet{
            progressBar.currentIndex = 2
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar = FlexibleSteppedProgressBar()
        createProgressBar(progressBar)
        createBackground(UIImage(named: "spaceXIOsBg")!, UIImageView(frame: self.view.frame))

        
    }
    
    @IBAction func continueBtnClicked(_ sender: Any) {
        isEmailVerified()
    }
    
    //MARK: - Login user func
    private func isEmailVerified() {
        let currentUser = UserDefaults.standard.object(forKey: kCURRENTUSER)
        let user = User.init(dictionary: currentUser as! NSDictionary)
        User.loginUserWith(email: user.email, password: user.password) { (error, isEmailVerified) in
            if error == nil {
                if isEmailVerified {
                    self.performSegue(withIdentifier: "goToAccountCreated", sender: nil)
                } else {
                    self.alertMessage(titleInput: "Email Doğrulama Hatası",
                                      messageInput: "Email doğrulanmamış. lütfen mailinize gönderilen doğrulama linkine tıklayın.")
                }
            }
        }
    }
    
}

//MARK: - To implement flexible func
extension ActivationViewController: FlexibleSteppedProgressBarDelegate {
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                         canSelectItemAtIndex index: Int) -> Bool {
            return false
        }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, textAtIndex index: Int,
                     position: FlexibleSteppedProgressBarTextLocation) -> String {

        if position == FlexibleSteppedProgressBarTextLocation.center {
            switch index {
            case 0: return "1"
            case 1: return "2"
            case 2: return "3"
            case 3: return "4"
            default: return "NONE"
            }
        }
        return ""
    }
}
