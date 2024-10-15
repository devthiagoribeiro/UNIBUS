//
//  api.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import Foundation

struct coordenadas: Codable, Hashable{
    var latitude: Double?
    var longitude: Double?
}
struct paradas: Codable,Hashable{
    var lat: Double?
    var long: Double?
}
struct unibus: Codable, Hashable{
    var _id: String
    var _rev: String
    var nome: String?
    var letra: String?
    var rota: [coordenadas]
    var parada: [paradas]
    var LA: Double?
    var LO: Double?
    var PositionX: Int?
    var PositionY: Int?
}
