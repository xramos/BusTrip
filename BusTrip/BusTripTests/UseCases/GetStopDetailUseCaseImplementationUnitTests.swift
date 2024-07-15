//
//  GetStopDetailUseCaseImplementationUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 27/6/24.
//

import XCTest
@testable import BusTrip

final class GetStopDetailUseCaseImplementationUnitTests: XCTestCase {

    var sut: GetStopDetailUseCase?

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testIsCalled() {
        
        // Given
        let stopId = 1
        let repository = MockTripRepository()
        sut = GetStopDetailUseCaseImplementation(repository: repository)
        
        // When
        _ = sut!.execute(stopId: stopId)
        
        // Then
        XCTAssertTrue(repository.isGetStopDetailCalled)
    }
}
