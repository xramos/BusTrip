//
//  TripUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class TripUnitTests: XCTestCase {

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
        let response = TripMock().generateTrip(route: route,
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
        XCTAssertEqual(response.status, status)
        XCTAssertEqual(response.startTime, startTime)
        XCTAssertEqual(response.endTime, endTime)
        XCTAssertEqual(response.origin.address, originAddress)
        XCTAssertEqual(response.origin.lat, originLatitude)
        XCTAssertEqual(response.origin.lon, originLongitude)
        XCTAssertEqual(response.destination.address, destinationAddress)
        XCTAssertEqual(response.destination.lat, destinationLatitude)
        XCTAssertEqual(response.destination.lon, destinationLongitude)
    }
}
