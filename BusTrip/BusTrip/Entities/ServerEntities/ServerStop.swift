//
//  ServerStop.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct ServerStop: Codable {
    
    let id: Int?
    let point: ServerPoint?
    
    func convertToEntity() -> Stop {
        
        return Stop(id: id ?? 0,
                    lat: point?._latitude ?? 0,
                    lon: point?._longitude ?? 0)
    }
}
