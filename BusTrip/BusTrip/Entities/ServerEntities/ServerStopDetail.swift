//
//  ServerStopDetail.swift
//  BusTrip
//
//  Created by Xavier Ramos on 27/6/24.
//

import Foundation

struct ServerStopDetail: Codable {
    
    let tripId: Int
    let userName: String
    let price: Double
    let address: String
    let paid: Bool
    let stopTime: String
    let point: ServerPoint
    
    func convertToEntity() -> StopDetail {
        
        return StopDetail(id: tripId,
                          userName: userName,
                          price: price,
                          address: address,
                          paid: paid,
                          stopTime: stopTime,
                          lat: point._latitude,
                          lon: point._longitude)
    }
}
