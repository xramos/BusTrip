//
//  ServerStopDetailUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 27/6/24.
//

import XCTest
@testable import BusTrip

final class ServerStopDetailUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let id = 1
        let userName = "Bruce Wayne"
        let price = 2.5
        let address = "Gotham"
        let paid = true
        let stopTime = "2018-12-18T08:10:00.000Z"
        let latitude = 41.38074
        let longitude = 2.18594
        
        // When
        let response = StopDetailMock().generateServerStopDetail(id: id,
                                                                 userName: userName,
                                                                 price: price,
                                                                 address: address,
                                                                 paid: paid,
                                                                 stopTime: stopTime,
                                                                 latitude: latitude,
                                                                 longitude: longitude)
              
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.tripId, id)
        XCTAssertEqual(response.userName, userName)
        XCTAssertEqual(response.price, price)
        XCTAssertEqual(response.address, address)
        XCTAssertEqual(response.paid, paid)
        XCTAssertEqual(response.stopTime, stopTime)
        XCTAssertEqual(response.point._latitude, latitude)
        XCTAssertEqual(response.point._longitude, longitude)
    }

    func testConvertToEntity() {

        // Given
        let request = StopDetailMock().generateServerStopDetail()
        
        // When
        let response = request.convertToEntity()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.id, request.tripId)
        XCTAssertEqual(response.userName, request.userName)
        XCTAssertEqual(response.price, request.price)
        XCTAssertEqual(response.address, request.address)
        XCTAssertEqual(response.paid, request.paid)
        XCTAssertEqual(response.stopTime, request.stopTime)
        XCTAssertEqual(response.lat, request.point._latitude)
        XCTAssertEqual(response.lon, request.point._longitude)
    }
}
