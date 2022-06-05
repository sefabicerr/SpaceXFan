//
//  LogInViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit

class LogInViewController: UIViewController,BackgroundImageProtocol,AlertProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    var window : UIWindow?
    
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
        resetThePassword()
    }
    
    @IBAction func logInBtnClicked(_ sender: Any) {
        if textFieldHaveText(){
            loginUser()
        } else {
            alertMessage(titleInput: "Hata", messageInput: "Email ya da şifre alanı boş olamaz.")
        }
    }
    
    //MARK: - For to login without being a member
    @IBAction func continueBtnClicked(_ sender: Any) {
        goToRockets()
    }
    
    @IBAction func signUpBtnClicked(_ sender: Any) {
        
    }
    
    //MARK: - Textfield have text control
    private func textFieldHaveText() -> Bool {
        return (emailTextField.text != "" && passwordTextField.text != "")
    }
    
    //MARK: - Login user func
    private func loginUser() {
        User.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error, isEmailVerified) in
            if error == nil {
                if isEmailVerified {
                    print("mail doğrulanmış")
                    self.goToRockets()
                } else {
                    self.alertMessage(titleInput: "Email Doğrulama Hatası",
                                      messageInput: "Email doğrulanmamış. lütfen mailinize gönderilen doğrulama linkine tıklayın.")
                }
            } else {
                self.alertMessage(titleInput: "Giriş Hatası",
                                  messageInput: "Girilen email ya da şifre hatalı. Lütfen kontrol ediniz.")
            }
        }
    }
    
    //MARK: - Reset the password func
    private func resetThePassword(){
        User.resetPasswordFor(email: emailTextField.text!) { (error) in
            if error == nil {
                self.alertMessage(titleInput: "Başarılı", messageInput: "Şifre yenileme maili gönderildi.")
            } else {
                let error = error?.localizedDescription
                self.alertMessage(titleInput: "Başarısız", messageInput: error!)
            }
        }
    }
    
    //MARK: - For login screen to rockets screen
    func goToRockets(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(identifier: "tabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarController)
    } 
}


