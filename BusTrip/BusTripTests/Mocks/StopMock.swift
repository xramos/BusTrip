//
//  StopMock.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
@testable import BusTrip

final class StopMock {
    
    let id = "1"
    let latitude = 41.38074
    let longitude = 2.18594
    
    // MARK: - Stop
    
    func generateStop(id: String? = nil,
                      latitude: Double? = nil,
                      longitude: Double? = nil) -> Stop {
        
        return Stop(id: id ?? self.id,
                    lat: latitude ?? self.latitude,
                    lon: longitude ?? self.longitude)
    }
    
    // MARK: - ServerStop
    
    func generateServerStop(id: String? = nil,
                            latitude: Double? = nil,
                            longitude: Double? = nil) -> ServerStop {
     
        let point = PointMock().generateServerPoint(latitude: latitude,
                                                    longitude: longitude)
        
        return ServerStop(id: id ?? self.id,
                          point: point)
    }
}
