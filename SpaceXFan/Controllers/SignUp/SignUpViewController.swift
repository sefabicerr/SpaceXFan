//
//  SignUpViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit
import FlexibleSteppedProgressBar

class SignUpViewController: UIViewController,ProgressBarProtocol,BackgroundImageProtocol,AlertProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet {
            passwordTextField.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    //MARK: - Vars
    var progressBar : FlexibleSteppedProgressBar! {
        didSet{
            progressBar.currentIndex = 0
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar = FlexibleSteppedProgressBar()
        createProgressBar(progressBar)
        createBackground(UIImage(named: "spaceXIOsBg")!, UIImageView(frame: self.view.frame))
        
    }
    
    @IBAction func showPasswordBtnClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            passwordTextField.isSecureTextEntry = true
        } else {
            sender.isSelected = true
            passwordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func continueBtnClicked(_ sender: Any) {
        if textFieldHaveText(){
            performSegue(withIdentifier: "toPrivacy", sender: nil)
        } else {
            alertMessage(titleInput: "Boş Alan Hatası", messageInput: "Lütfen tüm alanları doldurduğunuzdan emin olun.")
        }
    }
    
    //MARK: - Textfield have text control
    private func textFieldHaveText() -> Bool {
        return (nameTextField.text != "" &&
                emailTextField.text != "" &&
                passwordTextField.text != "" &&
                phoneTextField.text != "" &&
                countryTextField.text != "")
    }
    
    
}

//MARK: - To implement flexible func
extension SignUpViewController: FlexibleSteppedProgressBarDelegate {
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
