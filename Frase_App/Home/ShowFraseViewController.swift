//
//  ShowFraseViewController.swift
//  Frase_App
//
//  Created by mayre contreras on 07-12-22.
//

import UIKit
import Kingfisher
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift






class ShowFraseViewController: UIViewController {
    
    @IBOutlet weak var imageFrase: UIImageView!
    @IBOutlet weak var titleFraseLabel: UILabel!
    @IBOutlet weak var descriptionFraseLabel: UILabel!
    
    
    var fraseSelect: FrasesModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageFrase.kf.setImage(with: URL(string: fraseSelect?.imagen ?? ""))
        titleFraseLabel.text = fraseSelect?.titulo
        descriptionFraseLabel.text = fraseSelect?.descripcion
        
        
    }
}
