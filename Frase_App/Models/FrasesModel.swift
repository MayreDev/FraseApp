//
//  FrasesModel.swift
//  Frase_App
//
//  Created by mayre contreras on 07-12-22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift



struct FrasesModel: Codable{
    @DocumentID var id: String?
    let imagen: String
    let titulo: String
    let descripcion: String
    
    enum CodingKeys : String,CodingKey {
        case id
        case imagen
        case titulo
        case descripcion
    }
}
