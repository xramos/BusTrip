//
//  StopUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class StopUnitTests: XCTestCase {
    
    func testInit() {
        
        // Given
        let id = 1
        let latitude = 2.2
        let longitude = 4.2331
        
        // When
        let response = StopMock().generateStop(id: id,
                                               latitude: latitude,
                                               longitude: longitude)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.id, id)
        XCTAssertEqual(response.lat, latitude)
        XCTAssertEqual(response.lon, longitude)
    }
}
