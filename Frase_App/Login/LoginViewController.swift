//
//  LoginViewController.swift
//  Frase_App
//
//  Created by mayre contreras on 05-12-22.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiel:UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var labelFormateInvalidateEmail: UILabel!
    @IBOutlet weak var labelFormateInvalidatePassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "usuario1@gmail.com"
        passwordTextFiel.text = "123456"
    }
    

    @IBAction func loginButton(_ sender: UIButton) {
       
        let alert = UIAlertController(title: "Error", message: "User not registered, register or verify the data entered", preferredStyle: UIAlertController.Style.alert)
        let btOK = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(btOK)
        
        if ValidationUtils().isValidFullEmail(emailTextField.text!, label: labelFormateInvalidateEmail),
           ValidationUtils().isValidFullPassword(passwordTextFiel.text!, label: labelFormateInvalidatePassword){
                Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextFiel.text!)
                { (result, error) in
                if let _ = result, error == nil{
                    self.performSegue(withIdentifier: "Home_segue", sender: self)
                }else{
                    self.present(alert, animated: true)
                }
            }
        }
            
    }
    

 
}
