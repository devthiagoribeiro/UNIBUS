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
    var nome: String
    var letra: String?
    var rota: [coordenadas]
    var parada: [paradas]
    var LA: Double?
    var LO: Double?
    var PositionX: Int?
    var PositionY: Int?
    var val: Bool?
    var partida: String?
    var chegada: String?
    
}

struct unibusPref: Codable, Hashable{
    var _id: String?
    var _rev: String?
    var ids: [String]
    var date: Date?
}


extension Date {
    struct Formatter {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            return formatter
        }()
    }
    var iso8601: String { return Formatter.iso8601.string(from: self) }
}

extension String {
    var dateFromISO8601: Date? {
        return Date.Formatter.iso8601.date(from: self)
    }
}
