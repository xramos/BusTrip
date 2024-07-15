//
//  GetTripsUseCaseImplementationUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
@testable import BusTrip

final class GetTripsUseCaseImplementationUnitTests: XCTestCase {

    var sut: GetTripsUseCase?
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.+
        sut = nil
        
        try super.tearDownWithError()
    }

    func testIsCalled() {
        
        // Given
        let repository = MockTripRepository()
        sut = GetTripsUseCaseImplementation(repository: repository)
        
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetTripsCalled)
    }
}
