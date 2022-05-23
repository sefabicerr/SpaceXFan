//
//  PrivacyViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit
import FlexibleSteppedProgressBar

class PrivacyViewController: UIViewController,ProgressBarProtocol,BackgroundImageProtocol,AlertProtocol  {

    //MARK: - IBOutlets
    @IBOutlet weak var continueBtn: UIButton!{
        didSet {
            continueBtn.isEnabled = false
        }
    }
    
    //MARK: - Vars
    var progressBar : FlexibleSteppedProgressBar! {
        didSet{
            progressBar.currentIndex = 1
        }
    }
    var user : User!
    var isMembership = false
    var isPrivacy = false
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar = FlexibleSteppedProgressBar()
        createProgressBar(progressBar)
        createBackground(UIImage(named: "spaceXIOsBg")!, UIImageView(frame: self.view.frame))
        
    }
    
    @IBAction func membershipBtnClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            isMembership = false
            continueBtn.isEnabled = false
            print(isMembership)
        } else {
            sender.isSelected = true
            isMembership = true
            if isPrivacy{
                continueBtn.isEnabled = true
            }
            print("Tiklendi \(isMembership)")
        }
    }
    
 
    @IBAction func privacyBtnClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            isPrivacy = false
            print(isPrivacy)
        } else {
            sender.isSelected = true
            isPrivacy = true
            if isMembership{
                continueBtn.isEnabled = true
            }
            print("Tiklendi \(isPrivacy)")
        }
    }
    
    
    @IBAction func continueBtnClicked(_ sender: Any) {
        registerUser()
        
    }
    
    //MARK: - Register User
    private func registerUser() {
        User.registerUserWith(email: user.email, password: user.password) { (error) in
            if error == nil {
                print("Kayıt başarılı")
            } else {
                print("error:", error!.localizedDescription)
                self.alertMessage(titleInput: "Hata", messageInput: "Email adresi zaten başka bir hesap tarafından kullanılıyor, lütfen başka bir hesap kullanın.")
            }
        }
    }
}




//MARK: - To implement flexible func
extension PrivacyViewController: FlexibleSteppedProgressBarDelegate {
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
