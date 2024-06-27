//
//  ServerPointUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class ServerPointUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let latitude = 2.2
        let longitude = 4.2331
        
        // When
        let response = PointMock().generateServerPoint(latitude: latitude,
                                                       longitude: longitude)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response._latitude, latitude)
        XCTAssertEqual(response._longitude, longitude)
    }
}
