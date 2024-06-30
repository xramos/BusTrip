//
//  ReportUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 29/6/24.
//

import XCTest
@testable import BusTrip

final class ReportUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let name = "Bruce Wayne"
        let surname = "Batman"
        let email = "bruce@wayneenterprises.com"
        let phone = "654123789"
        let reportTime = "2018-12-18T08:00:00.000Z"
        let reportDescription = "Issues with Gotham bus trip"
        
        // When
        let response = ReportMock().generateReport(name: name,
                                                   surname: surname,
                                                   email: email,
                                                   phone: phone,
                                                   reportTime: reportTime,
                                                   reportDescription: reportDescription)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.name, name)
        XCTAssertEqual(response.surname, surname)
        XCTAssertEqual(response.email, email)
        XCTAssertEqual(response.phone, phone)
        XCTAssertEqual(response.reportTime, reportTime)
        XCTAssertEqual(response.reportDescription, reportDescription)
    }
}
