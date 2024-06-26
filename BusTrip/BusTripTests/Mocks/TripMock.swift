//
//  TripMock.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
@testable import BusTrip

final class TripMock {
    
    let route = "123"
    let driverName = "Bruce Wayne"
    let description = "Barcelona a Martorell"
    let status = Status.ongoing
    let startTime = "2018-12-18T08:00:00.000Z"
    let endTime = "2018-12-18T09:00:00.000Z"
    
    let originAddress = "Barcelona"
    let originLatitude = 41.38074
    let originLongitude = 2.18594
    
    let destinationAddress = "Martorell"
    let destinationLatitude = 41.49958
    let destinationLongitude = 1.90307
    
    // MARK: - Trip
    
    func generateTrip(route: String? = nil,
                      driverName: String? = nil,
                      description: String? = nil,
                      status: Status? = nil,
                      startTime: String? = nil,
                      endTime: String? = nil,
                      originAddress: String? = nil,
                      originLatitude: Double? = nil,
                      originLongitude: Double? = nil,
                      destinationAddress: String? = nil,
                      destinationLatitude: Double? = nil,
                      destinationLongitude: Double? = nil) -> Trip {
        
        let origin = AddressMock().generateAddress(address: originAddress ?? self.originAddress,
                                                   latitude: originLatitude ?? self.originLatitude,
                                                   longitude: originLongitude ?? self.originLongitude)
        
        let destination = AddressMock().generateAddress(address: destinationAddress ?? self.destinationAddress,
                                                        latitude: destinationLatitude ?? self.destinationLatitude,
                                                        longitude: destinationLongitude ?? self.destinationLongitude)
        
        return Trip(route: route ?? self.route,
                    driverName: driverName ?? self.driverName,
                    description: description ?? self.description,
                    status: status ?? self.status,
                    startTime: startTime ?? self.startTime,
                    endTime: endTime ?? self.endTime,
                    origin: origin, 
                    destination: destination,
                    stops: [])
    }
    
    // MARK: - ServerTrip
    
    func generateServerTrip(route: String? = nil,
                            driverName: String? = nil,
                            description: String? = nil,
                            status: Status? = nil,
                            startTime: String? = nil,
                            endTime: String? = nil,
                            originAddress: String? = nil,
                            originLatitude: Double? = nil,
                            originLongitude: Double? = nil,
                            destinationAddress: String? = nil,
                            destinationLatitude: Double? = nil,
                            destinationLongitude: Double? = nil) -> ServerTrip {
     
        let origin = AddressMock().generateServerAddress(address: originAddress ?? self.originAddress,
                                                   latitude: originLatitude ?? self.originLatitude,
                                                   longitude: originLongitude ?? self.originLongitude)
        
        let destination = AddressMock().generateServerAddress(address: destinationAddress ?? self.destinationAddress,
                                                        latitude: destinationLatitude ?? self.destinationLatitude,
                                                        longitude: destinationLongitude ?? self.destinationLongitude)
        
        return ServerTrip(route: route ?? self.route,
                          driverName: driverName ?? self.driverName,
                          description: description ?? self.description,
                          status: status?.rawValue ?? self.status.rawValue,
                          startTime: startTime ?? self.startTime,
                          endTime: endTime ?? self.endTime,
                          origin: origin,
                          destination: destination,
                          stops: [])
    }
}
