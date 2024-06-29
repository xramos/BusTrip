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
    
    var isGetReportsCalled: Bool = false
    var isSaveReportCalled: Bool = false
    
    @discardableResult func getTrips() -> AnyPublisher<[Trip], Error> {
        
        isGetTripsCalled = true
        
        // We don't care about the return result
        return Result.Publisher([]).eraseToAnyPublisher()
    }
    
    @discardableResult func getReports() -> [Report] {
        
        isGetReportsCalled = true
        
        return []
    }
    
    func saveReport(report: Report) {
        
        isSaveReportCalled = true
    }
}
