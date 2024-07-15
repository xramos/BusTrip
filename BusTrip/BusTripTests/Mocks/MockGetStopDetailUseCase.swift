//
//  MockGetStopDetailUseCase.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation
import Combine

@testable import BusTrip

class MockGetStopDetailUseCase: GetStopDetailUseCase {
    
    var isExecuteCalled: Bool = false
    
    @discardableResult  func execute(stopId: Int) -> AnyPublisher<StopDetail, Error> {
    
        isExecuteCalled = true
        
        // We don't care about the return result
        return Result.Publisher(NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
