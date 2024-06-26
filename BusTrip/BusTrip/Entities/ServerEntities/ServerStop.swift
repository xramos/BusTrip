//
//  ServerStop.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct ServerStop: Codable {
    
    let id: String
    let point: ServerPoint
    
    func convertToEntity() -> Stop {
        
        return Stop(id: id,
                    lat: point._latitude,
                    lon: point._longitude)
    }
}
