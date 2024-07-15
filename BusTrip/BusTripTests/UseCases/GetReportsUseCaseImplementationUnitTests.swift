//
//  GetReportsUseCaseImplementationUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 29/6/24.
//

import XCTest
@testable import BusTrip

final class GetReportsUseCaseImplementationUnitTests: XCTestCase {

    var sut: GetReportsUseCase?
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.+
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testIsCalled() {
        
        // Given
        let repository = MockTripRepository()
        sut = GetReportsUseCaseImplementation(repository: repository)
        
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetReportsCalled)
    }
}
