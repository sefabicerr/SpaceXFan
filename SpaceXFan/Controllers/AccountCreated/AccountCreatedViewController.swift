//
//  AccountCreatedViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit
import FlexibleSteppedProgressBar

class AccountCreatedViewController: UIViewController,ProgressBarProtocol,BackgroundImageProtocol {

    
    //MARK: - Vars
    var progressBar: FlexibleSteppedProgressBar! {
        didSet{
            progressBar.currentIndex = 3
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar = FlexibleSteppedProgressBar()
        createProgressBar(progressBar)
        createBackground(UIImage(named: "spaceXIOsBg")!, UIImageView(frame: self.view.frame))
       
    }
    
    @IBAction func logInBtnClicked(_ sender: Any) {
        
        goToLogin()
    }
  
    //MARK: For accountCreated screen to login screen
    func goToLogin(){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        self.present(controller, animated: true, completion: nil)
    }



}

//MARK: - To implement flexible func
extension AccountCreatedViewController: FlexibleSteppedProgressBarDelegate {
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

