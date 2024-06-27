//
//  ServerAddress.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct ServerAddress: Codable {
    
    let address: String
    let point: ServerPoint
    
    func convertToEntity() -> Address {
        
        return Address(address: address,
                       lat: point._latitude,
                       lon: point._longitude)
    }
}
