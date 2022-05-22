//
//  LogInViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit

class LogInViewController: UIViewController,BackgroundImageProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBackground(UIImage(named: "welcomePageBg")!,
                         UIImageView(frame: self.view.frame))
        
        
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
    
    @IBAction func forgotPasswordBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func logInBtnClicked(_ sender: Any) {
        
    }
    
    //MARK: - For to login without being a member
    @IBAction func continueBtnClicked(_ sender: Any) {
        goToRockets()
    }
    
    @IBAction func signUpBtnClicked(_ sender: Any) {
        
    }
    
    //MARK: - For login screen to rockets screen
    func goToRockets(){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RocketsVC") as! RocketsViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true, completion: nil)
    }
    
    
    
}


