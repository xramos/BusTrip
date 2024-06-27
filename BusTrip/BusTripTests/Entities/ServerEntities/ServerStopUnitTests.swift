//
//  ServerStopUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class ServerStopUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let id = 1
        let latitude = 2.2
        let longitude = 4.2331
        
        // When
        let response = StopMock().generateServerStop(id: id,
                                                     latitude: latitude,
                                                     longitude: longitude)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.id, id)
        XCTAssertEqual(response.point!._latitude, latitude)
        XCTAssertEqual(response.point!._longitude, longitude)
    }
}
