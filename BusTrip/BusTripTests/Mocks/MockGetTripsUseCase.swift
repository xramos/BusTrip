//
//  MockGetTripsUseCase.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation
import Combine

@testable import BusTrip

class MockGetTripsUseCase: GetTripsUseCase {
    
    var isExecuteCalled: Bool = false
    
    @discardableResult func execute() -> AnyPublisher<[Trip], Error> {
        
        isExecuteCalled = true
        
        // We don't care about the return result
        return Result.Publisher([]).eraseToAnyPublisher()
    }
}
