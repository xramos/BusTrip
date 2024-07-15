//
//  SaveReportUseCaseImplementationUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 29/6/24.
//

import XCTest
@testable import BusTrip

final class SaveReportUseCaseImplementationUnitTests: XCTestCase {

    var sut: SaveReportUseCase?
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.+
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testIsCalled() {
        
        // Given
        let repository = MockTripRepository()
        sut = SaveReportUseCaseImplementation(repository: repository)
        
        let report = ReportMock().generateReport()
        
        // When
        sut!.execute(report: report)
        
        // Then
        XCTAssertTrue(repository.isSaveReportCalled)
    }
}
