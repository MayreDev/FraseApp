//
//  HomeViewController.swift
//  Frase_App
//
//  Created by mayre contreras on 06-12-22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameUserLabel: UILabel!
    
    let database = Firestore.firestore()
    let loginUser = Auth.auth().currentUser
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataUser()

     
    }
    
    
    func getDataUser(){
        
        database.collection("users").whereField("userId", isEqualTo: loginUser?.uid ?? "")
            .getDocuments { result, error in
                if !(result?.documents.isEmpty)!{
                   
                    let nameUser =  result?.documents[0].data()["name"] as? String
             
                    self.nameUserLabel.text = nameUser
                }
                
               
            }
        
        
    }


}
