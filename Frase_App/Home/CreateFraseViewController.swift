//
//  CreateFraseViewController.swift
//  Frase_App
//
//  Created by mayre contreras on 08-12-22.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class CreateFraseViewController: UIViewController {
    
    
    @IBOutlet weak var createImagenFrase: UIImageView!
    @IBOutlet weak var createTittleFraseTF: UITextField!
    @IBOutlet weak var createDescriptionFraseTF: UITextField!
    
    let database = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func createFraseAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Error", message: "You must enter a title or a description of the phrase", preferredStyle: UIAlertController.Style.alert)
        var btOK = UIAlertAction(title: "Ok", style: .default)
        
        
        let myFrase: FrasesModel = FrasesModel(imagen: "https://www.psicoactiva.com/wp-content/uploads/2016/04/frases-exito.jpg", titulo: createTittleFraseTF.text ?? "", descripcion: createDescriptionFraseTF.text ?? "")
        if !myFrase.titulo.isEmpty && !myFrase.descripcion.isEmpty {
            do{
                _ = try database.collection("frases").addDocument(from: myFrase)
                alert.title = "Perfect"
                alert.message = "your phrase has been created"
                btOK = UIAlertAction(title: "Ok", style: .default) { _ in
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(btOK)
                
                self.present(alert, animated: true)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        else{
            alert.addAction(btOK)
            self.present(alert, animated: true)
            
        }
    }
    

}
