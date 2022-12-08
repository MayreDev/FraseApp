//
//  FrasesModel.swift
//  Frase_App
//
//  Created by mayre contreras on 07-12-22.
//

import Foundation

struct FrasesModel: Codable{
    let imagen: String
    let titulo: String
    let descripcion: String
    
    enum CodingKeys : String,CodingKey {
        case imagen
        case titulo
        case descripcion
    }
}
