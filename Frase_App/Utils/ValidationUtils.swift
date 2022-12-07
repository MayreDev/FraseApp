//
//  ValidationUtils.swift
//  Frase_App
//
//  Created by mayre contreras on 06-12-22.
//

import Foundation
import UIKit

class ValidationUtils{
    
    //para validar que tenga formato email correcto
    func isValidFullEmail(_ email: String, label:UILabel) -> Bool {
        if(validateEmptyField(text: email, label: label)){
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailPred.evaluate(with: email){
                label.text = "Error, invalid email format"
            } else{
                label.text = ""
            }
            return emailPred.evaluate(with: email)
        }else{
            return false
        }
    }
    //para validar que tenga 6 caracteres de password
    func isValidFullPassword(_ password: String, label:UILabel) -> Bool{
        var validpassword = false
        
        if(validateEmptyField(text: password, label: label)){
            if password.count >= 6{
                validpassword = true
                label.text = ""
            }else{
                label.text = "Error, password need at least 6 characters"
            }
            return validpassword
        }
        return false
    }
    
    //validar que no hayan campos vacios
    func validateEmptyField (text: String, label:UILabel) -> Bool {
        if text.isEmpty {
            label.text = "Error empty field"
            return false
        }else{
            label.text = ""
            return true
        }
        
        
        
    }
}
