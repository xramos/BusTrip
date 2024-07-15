//
//  MockGetReportsUseCase.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation

@testable import BusTrip

class MockGetReportsUseCase: GetReportsUseCase {
    
    var isExecuteCalled: Bool = false
    
    @discardableResult func execute() -> [Report] {
        
        isExecuteCalled = true
        
        // We don't care about the return result
        return []
    }
}
