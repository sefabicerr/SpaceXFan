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
    var pickerView = UIPickerView()
    var countryList = [String]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar = FlexibleSteppedProgressBar()
        createProgressBar(progressBar)
        createBackground(UIImage(named: "spaceXIOsBg")!, UIImageView(frame: self.view.frame))
        
        countryList = ["Turkey", "Germany", "Poland", "Egypt"]
        createPicker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPrivacy" {
            let user = sender as? User
            let VC = segue.destination as! PrivacyViewController
            VC.user = user
        }
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
            let user = User(userId: "", name: nameTextField.text!,
                        email: emailTextField.text!,
                        phone: phoneTextField.text!,
                        country: countryTextField.text!,
                            password: passwordTextField.text!)
            saveUserLocally(userDictionary: userDictionaryFrom(user: user))
            performSegue(withIdentifier: "toPrivacy", sender: user)
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
    
    //MARK: - For create pickerView in country textField
    func createPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        countryTextField.inputView = pickerView
        let toolBar = UIToolbar()
        toolBar.tintColor = UIColor(named: "appColor")
        toolBar.sizeToFit()
        
        let saveBtn = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveBtnClicked))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClicked))
        
        toolBar.setItems([cancelBtn,space,saveBtn], animated: true)
        countryTextField.inputAccessoryView = toolBar
    }
    
    @objc func cancelBtnClicked(){
        countryTextField.text = ""
        countryTextField.placeholder = "Country"
        view.endEditing(true)
    }
    
    @objc func saveBtnClicked(){
        view.endEditing(true)
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

extension SignUpViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countryList[row]
    }
    
}
