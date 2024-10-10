//
//  api.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import Foundation

struct coordenadas: Codable, Hashable{
    var lat: Double?
    var long: Double?
}
    
struct unibus: Codable, Hashable{
    var _id: String
    var _rev: String
    var nome: String?
    var imagem: String?
    var itinerario: String?
    var rota: [coordenadas]
    var data : String?
}
