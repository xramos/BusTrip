//
//  RemoteTripDataSourceUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class RemoteTripDataSourceUnitTests: XCTestCase {

    var sut: RemoteTripDataSource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = RemoteTripDataSource(baseURLString: "http://jsonplaceholder.typicode.com")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetTripsEndpoint() {
        
        // When
        let response = sut!.makeGetTrips()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString, "http://jsonplaceholder.typicode.com/tech-test/trips.json")
    }
}
