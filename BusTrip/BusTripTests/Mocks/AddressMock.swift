//
//  AddressMock.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
@testable import BusTrip

final class AddressMock {
    
    let address = "Barcelona a Martorell"
    let latitude = 41.38074
    let longitude = 2.18594
    
    // MARK: - Address
    
    func generateAddress(address: String? = nil,
                         latitude: Double? = nil,
                         longitude: Double? = nil) -> Address {
        
        return Address(address: address ?? self.address,
                       lat: latitude ?? self.latitude,
                       lon: longitude ?? self.longitude)
    }
    
    // MARK: - ServerAddress
    
    func generateServerAddress(address: String? = nil,
                               latitude: Double? = nil,
                               longitude: Double? = nil) -> ServerAddress {
     
        let point = PointMock().generateServerPoint(latitude: latitude,
                                                    longitude: longitude)
        
        return ServerAddress(address: address ?? self.address,
                             point: point)
    }
}
