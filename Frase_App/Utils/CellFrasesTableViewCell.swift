//
//  CellFrasesTableViewCell.swift
//  Frase_App
//
//  Created by mayre contreras on 07-12-22.
//

import UIKit
import Kingfisher
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class CellFrasesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageFrase: UIImageView!
    @IBOutlet weak var titleFraseLabel: UILabel!
    @IBOutlet weak var descriptionFraseLabel: UILabel!
   
    
    let database = Firestore.firestore()
    var fraseId:String = ""
    var deleteFrase : (() -> Void)? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        imageFrase.layer.cornerRadius = imageFrase.frame.width / 2
    }
    
    func setupCell(frase: FrasesModel){
        fraseId = frase.id ?? ""
        titleFraseLabel.text = frase.titulo
        descriptionFraseLabel.text =  frase.descripcion
        if !frase.imagen.isEmpty{
            imageFrase.kf.setImage(with: URL(string: frase.imagen))
        }else{
            imageFrase.isHidden = true
        }
    }
    
    @IBAction func deleteFraseAction(_ sender: UIButton) {
        deleteFrase!()
}
    
}

