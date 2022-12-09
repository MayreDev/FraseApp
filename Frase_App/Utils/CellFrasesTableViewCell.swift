//
//  CellFrasesTableViewCell.swift
//  Frase_App
//
//  Created by mayre contreras on 07-12-22.
//

import UIKit
import Kingfisher


class CellFrasesTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFrase: UIImageView!
    @IBOutlet weak var titleFraseLabel: UILabel!
    @IBOutlet weak var descriptionFraseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        imageFrase.layer.cornerRadius = imageFrase.frame.width / 2
    }
    
    func setupCell(frase: FrasesModel){
        
        titleFraseLabel.text = frase.titulo
        descriptionFraseLabel.text =  frase.descripcion
        if !frase.imagen.isEmpty{
            imageFrase.kf.setImage(with: URL(string: frase.imagen))
        }else{
            imageFrase.isHidden = true
        }
          
        
    }
    
}
