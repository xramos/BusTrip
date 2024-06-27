//
//  AddressUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class AddressUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let address = "Gotham"
        let latitude = 2.2
        let longitude = 4.2331
        
        // When
        let response = AddressMock().generateAddress(address: address,
                                                     latitude: latitude,
                                                     longitude: longitude)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.address, address)
        XCTAssertEqual(response.lat, latitude)
        XCTAssertEqual(response.lon, longitude)
    }
}
