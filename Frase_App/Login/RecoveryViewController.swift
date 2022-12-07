//
//  RecoveryViewController.swift
//  Frase_App
//
//  Created by mayre contreras on 05-12-22.
//

import UIKit



class RecoveryViewController: UIViewController {

    @IBOutlet weak var emailRecoveryTextField: UITextField!
    @IBOutlet weak var labelErrorEmailRecovery: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func actionRecovery(_ sender: UIButton) {
        if  ValidationUtils().isValidFullEmail(emailRecoveryTextField.text!, label: labelErrorEmailRecovery){
        }
    }


}
