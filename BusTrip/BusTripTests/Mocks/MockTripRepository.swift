//
//  MockTripRepository.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import Combine
@testable import BusTrip

class MockTripRepository: TripRepository {
    
    var isGetTripsCalled: Bool = false
    var isGetStopDetailCalled: Bool = false
    
    @discardableResult func getTrips() -> AnyPublisher<[Trip], Error> {
        
        isGetTripsCalled = true
        
        // We don't care about the return result
        return Result.Publisher([]).eraseToAnyPublisher()
    }
    
    @discardableResult func getStopDetail(stopId: Int) -> AnyPublisher<StopDetail, Error> {
        
        isGetStopDetailCalled = true
        
        // We don't care about the return result
        return Result.Publisher(NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
