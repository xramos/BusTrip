//
//  DBManagerUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 29/6/24.
//

import XCTest

@testable import BusTrip

final class DBManagerUnitTests: XCTestCase {

    var sut: DBManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = DBManager(coreDataStack: TestCoreDataStack())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testSaveReport() {
     
        // Given
        let report = ReportMock().generateReport()
        
        // When
        sut.saveReport(report: report)
        let response = sut.getReports()
        
        // Then
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(response[0].name, report.name)
        XCTAssertEqual(response[0].surname, report.surname)
        XCTAssertEqual(response[0].email, report.email)
        XCTAssertEqual(response[0].phone, report.phone)
        XCTAssertEqual(response[0].reportTime, report.reportTime)
        XCTAssertEqual(response[0].reportDescription, report.reportDescription)
    }
}
