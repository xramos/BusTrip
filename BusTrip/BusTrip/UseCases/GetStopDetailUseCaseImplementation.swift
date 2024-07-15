//
//  GetStopDetailUseCaseImplementation.swift
//  BusTrip
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation
import Combine

class GetStopDetailUseCaseImplementation {
    
    private let repository: TripRepository
    
    init(repository: TripRepository = TripRepositoryImplementation()) {
        
        self.repository = repository
    }
}

extension GetStopDetailUseCaseImplementation: GetStopDetailUseCase {
    
    func execute(stopId: Int) -> AnyPublisher<StopDetail, Error> {
        
        return repository.getStopDetail(stopId: stopId)
    }
}
