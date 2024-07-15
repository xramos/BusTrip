//
//  ReportViewModelUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 30/6/24.
//

import XCTest

@testable import BusTrip

final class ReportViewModelUnitTests: XCTestCase {

    var sut: ReportViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = ReportViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testSaveButtonEnabled() {
        
        // Given
        sut?.nameInput = "Bruce"
        sut?.surnameInput = "Wayne"
        sut?.emailInput = "bruce@wayne.tech"
        sut?.dateString = "15/07/2024 12:00"
        sut?.reportDescription = "Incident involving batmobile"
        
        // When
        let response = sut?.isSaveButtonDisabled()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertFalse(response!)
    }
    
    func testSaveButtonDisabledEmailWrongFormat() {
        
        // Given
        sut?.nameInput = "Bruce"
        sut?.surnameInput = "Wayne"
        sut?.emailInput = "bruce"
        sut?.dateString = "15/07/2024 12:00"
        sut?.reportDescription = "Incident involving batmobile"
        
        // When
        let response = sut?.isSaveButtonDisabled()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertTrue(response!)
    }
    
    func testSaveButtonDisabledLongDescription() {
        
        // Given
        sut?.nameInput = "Bruce"
        sut?.surnameInput = "Wayne"
        sut?.emailInput = "bruce@wayne.tech"
        sut?.dateString = "15/07/2024 12:00"
        sut?.reportDescription = "This is a very long report description about an incident involving the batmobile because Dick Grayson made a scratch when chasing Joker after an escape on Arkham Asylum. Need and assesssment of the cost of repair and send the invoce to Dick with a note saying to be extra cautious with this things, money does not grow on trees the last time i check."
        
        // When
        let response = sut?.isSaveButtonDisabled()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertTrue(response!)
    }
    
    func testUseCasesCalled() {
        
        // Given
        let saveReportUseCase = MockSaveReportUseCase()
        let getReportsUseCase = MockGetReportsUseCase()
        sut = ReportViewModel(saveReportUseCase: saveReportUseCase,
                              getReportsUseCase: getReportsUseCase)
        
        // When
        sut?.saveReport()
        
        // Then
        XCTAssertTrue(saveReportUseCase.isExecuteCalled)
        XCTAssertTrue(getReportsUseCase.isExecuteCalled)
    }
}
