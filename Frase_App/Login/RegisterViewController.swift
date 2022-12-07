//
//  RegisterViewController.swift
//  Frase_App
//
//  Created by mayre contreras on 05-12-22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiel:UITextField!
    @IBOutlet weak var repeatPasswordTextFiel:UITextField!
    @IBOutlet weak var labelErrorName: UILabel!
    @IBOutlet weak var labelValidateFormatoEmail: UILabel!
    @IBOutlet weak var labelValidateFormatePassword: UILabel!
    @IBOutlet weak var labelValidateRepeatPassword: UILabel!
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerUser(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Error", message: "This user is already registered, use another email", preferredStyle: UIAlertController.Style.alert)
        let btOK = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(btOK)
        
        if ValidationUtils().validateEmptyField(text: nameTextField.text!, label: labelErrorName),
           ValidationUtils().isValidFullEmail(emailTextField.text!, label: labelValidateFormatoEmail),
           ValidationUtils().isValidFullPassword(passwordTextFiel.text!, label: labelValidateFormatePassword),
           ValidationUtils().validateEmptyField(text: repeatPasswordTextFiel.text!, label: labelValidateRepeatPassword){
            if  self.passwordTextFiel.text == self.repeatPasswordTextFiel.text{
                self.labelValidateRepeatPassword.text = ""
                self.labelValidateFormatePassword.text = ""
                
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextFiel.text!){ (result, error) in
                    if let _ = result, error == nil{
                        
                        let registerUser: [String: String] = [
                            "userId": result?.user.uid ?? "",
                            "name": self.nameTextField.text!,
                            "email": result?.user.email ?? "",
                        ]
                        self.database.collection("users").addDocument(data: registerUser).addSnapshotListener({ result, error in
                            self.navigationController?.popViewController(animated: true)
                        })
                    }else{
                        self.present(alert, animated: true)
                    }
                }
            }else{
                self.labelValidateRepeatPassword.text = "passwords do not match"
                self.labelValidateFormatePassword.text = "passwords do not match"
            }
        }
    }
    
    
}
