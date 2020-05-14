//
//  RegisterVC.swift
//  Ecommerce
//
//  Created by user162241 on 5/13/20.
//  Copyright © 2020 user162241. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmpasswordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passwordCheckImage: UIImageView!
    
    @IBOutlet weak var conPasswordCheckImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmpasswordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)    }
    @objc func textFieldDidChange(_ textField: UITextField){
        
        guard let passtxt  = passwordTxt.text else{return}
        
        //when typing in the confirmpassowrd text field
        if textField == confirmpasswordTxt{
            passwordCheckImage.isHidden = false
            conPasswordCheckImage.isHidden = false
        }else{
            if passtxt.isEmpty{
                passwordCheckImage.isHidden = true
                conPasswordCheckImage.isHidden = true
                confirmpasswordTxt.text =  ""
            }
        }
        
        // if passwords match then make the change the image to green
        
        if passwordTxt.text == confirmpasswordTxt.text{
            passwordCheckImage.image = UIImage(named: AppImages.GreenCheck)
            conPasswordCheckImage.image =  UIImage(named: AppImages.GreenCheck)
        }else{
            passwordCheckImage.image = UIImage(named: AppImages.RedCheck)
            conPasswordCheckImage.image =  UIImage(named: AppImages.RedCheck)
            
        }
    }

    @IBAction func registerClicked(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
            let username = usernameTxt.text, username.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty
        else{ return}
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error{
                debugPrint(error)
            }
            print("user is sucessfully entered")
        }
        
    }
    

}
