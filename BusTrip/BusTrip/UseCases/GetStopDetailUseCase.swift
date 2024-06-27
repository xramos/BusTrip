//
//  GetStopDetailUseCase.swift
//  BusTrip
//
//  Created by Xavier Ramos on 27/6/24.
//

import Foundation
import Combine

class GetStopDetailUseCase {
    
    private let repository: TripRepository
    
    init(repository: TripRepository = TripRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(stopId: Int) -> AnyPublisher<StopDetail, Error> {
        
        return repository.getStopDetail(stopId: stopId)
    }
}
