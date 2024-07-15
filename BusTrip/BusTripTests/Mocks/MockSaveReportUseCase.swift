//
//  MockSaveReportUseCase.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation

@testable import BusTrip

class MockSaveReportUseCase: SaveReportUseCase {
    
    var isExecuteCalled: Bool = false
    
    func execute(report: Report) {
        
        isExecuteCalled = true
    }
}
