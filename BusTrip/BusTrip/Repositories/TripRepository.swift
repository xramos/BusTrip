//
//  TripRepository.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import Combine

protocol TripRepository {
    
    func getTrips() -> AnyPublisher<[Trip], Error>
    
    func saveReport(report: Report)
}
