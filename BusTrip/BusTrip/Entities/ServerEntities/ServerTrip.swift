//
//  ServerTrip.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct ServerTrip: Codable {
    
    let route: String
    let driverName: String
    let description: String
    let status: String
    let startTime: String
    let endTime: String
    
    let origin: ServerAddress
    let destination: ServerAddress
    let stops: [ServerStop]
    
    func convertToEntity() -> Trip {
        
        var tripStops: [Stop] = []
        for stop in stops {
            tripStops.append(stop.convertToEntity())
        }
        
        return Trip(route: route,
                    driverName: driverName,
                    description: description,
                    status: Status(rawValue: status) ?? .unknown,
                    startTime: startTime,
                    endTime: endTime,
                    origin: origin.convertToEntity(),
                    destination: destination.convertToEntity(),
                    stops: tripStops)
    }
}
