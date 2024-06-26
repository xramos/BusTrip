//
//  PointMock.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
@testable import BusTrip

final class PointMock {
    
    let latitude = 41.38074
    let longitude = 2.18594
    
    // MARK: - ServerPoint
    
    func generateServerPoint(latitude: Double? = nil,
                       longitude: Double? = nil) -> ServerPoint {
        
        return ServerPoint(_latitude: latitude ?? self.latitude,
                           _longitude: longitude ?? self.longitude)
    }
}
