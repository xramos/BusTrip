//
//  StopDetailMock.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 27/6/24.
//

import Foundation
@testable import BusTrip

final class StopDetailMock {
    
    let id = 1
    let userName = "Bruce Wayne"
    let price = 2.5
    let address = "Gotham"
    let paid = true
    let stopTime = "2018-12-18T08:10:00.000Z"
    let latitude = 41.38074
    let longitude = 2.18594
    
    // MARK: - StopDetail
    
    func generateStopDetail(id: Int? = nil,
                            userName: String? = nil,
                            price: Double? = nil,
                            address: String? = nil,
                            paid: Bool? = nil,
                            stopTime: String? = nil,
                            latitude: Double? = nil,
                            longitude: Double? = nil) -> StopDetail {
        
        return StopDetail(id: id ?? self.id,
                          userName: userName ?? self.userName, 
                          price: price ?? self.price,
                          address: address ?? self.address,
                          paid: paid ?? self.paid,
                          stopTime: stopTime ?? self.stopTime,
                          lat: latitude ?? self.latitude,
                          lon: longitude ?? self.longitude)
    }
    
    // MARK: - ServerStopDetail
    
    func generateServerStopDetail(id: Int? = nil,
                                  userName: String? = nil,
                                  price: Double? = nil,
                                  address: String? = nil,
                                  paid: Bool? = nil,
                                  stopTime: String? = nil,
                                  latitude: Double? = nil,
                                  longitude: Double? = nil) -> ServerStopDetail {
        
        let serverPoint = ServerPoint(_latitude: latitude ?? self.latitude,
                                      _longitude: longitude ?? self.longitude)
        
        return ServerStopDetail(tripId: id ?? self.id,
                                userName: userName ?? self.userName,
                                price: price ?? self.price,
                                address: address ?? self.address,
                                paid: paid ?? self.paid,
                                stopTime: stopTime ?? self.stopTime,
                                point: serverPoint)
    }
    
}
