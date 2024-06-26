//
//  ServerTripUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class ServerTripUnitTests: XCTestCase {

    func testInit() {
        
        // Given
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
        
        // When
        let response = TripMock().generateServerTrip(route: route,
                                                     driverName: driverName,
                                                     description: description,
                                                     status: status,
                                                     startTime: startTime,
                                                     endTime: endTime,
                                                     originAddress: originAddress,
                                                     originLatitude: originLatitude,
                                                     originLongitude: originLongitude,
                                                     destinationAddress: destinationAddress,
                                                     destinationLatitude: destinationLatitude,
                                                     destinationLongitude: destinationLongitude)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.route, route)
        XCTAssertEqual(response.driverName, driverName)
        XCTAssertEqual(response.description, description)
        XCTAssertEqual(response.status, status.rawValue)
        XCTAssertEqual(response.startTime, startTime)
        XCTAssertEqual(response.endTime, endTime)
        XCTAssertEqual(response.origin.address, originAddress)
        XCTAssertEqual(response.origin.point._latitude, originLatitude)
        XCTAssertEqual(response.origin.point._longitude, originLongitude)
        XCTAssertEqual(response.destination.address, destinationAddress)
        XCTAssertEqual(response.destination.point._latitude, destinationLatitude)
        XCTAssertEqual(response.destination.point._longitude, destinationLongitude)
    }
    
    func testConvertToEntity() {
        
        // Given
        let request = TripMock().generateServerTrip()
        
        // When
        let response = request.convertToEntity()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.route, request.route)
        XCTAssertEqual(response.driverName, request.driverName)
        XCTAssertEqual(response.description, request.description)
        XCTAssertEqual(response.status.rawValue, request.status)
        XCTAssertEqual(response.startTime, request.startTime)
        XCTAssertEqual(response.endTime, request.endTime)
        XCTAssertEqual(response.origin.address, request.origin.address)
        XCTAssertEqual(response.origin.lat, request.origin.point._latitude)
        XCTAssertEqual(response.origin.lon, request.origin.point._longitude)
        XCTAssertEqual(response.destination.address, request.destination.address)
        XCTAssertEqual(response.destination.lat, request.destination.point._latitude)
        XCTAssertEqual(response.destination.lon, request.destination.point._longitude)
    }
}
