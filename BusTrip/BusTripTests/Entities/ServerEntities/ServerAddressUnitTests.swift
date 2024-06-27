//
//  ServerAddressUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class ServerAddressUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let address = "Gotham"
        let latitude = 2.2
        let longitude = 4.2331
        
        // When
        let response = AddressMock().generateServerAddress(address: address,
                                                           latitude: latitude,
                                                           longitude: longitude)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.address, address)
        XCTAssertEqual(response.point._latitude, latitude)
        XCTAssertEqual(response.point._longitude, longitude)
    }
    
    func testConvertToEntity() {
        
        // Given
        let request = AddressMock().generateServerAddress()
        
        // When
        let response = request.convertToEntity()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.address, request.address)
        XCTAssertEqual(response.lat, request.point._latitude)
        XCTAssertEqual(response.lon, request.point._longitude)
    }
}
