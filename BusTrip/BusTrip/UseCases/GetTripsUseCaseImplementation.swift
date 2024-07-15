//
//  GetTripsUseCaseImplementation.swift
//  BusTrip
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation
import Combine

class GetTripsUseCaseImplementation {
    
    private let repository: TripRepository
    
    init(repository: TripRepository = TripRepositoryImplementation()) {
        
        self.repository = repository
    }
}

extension GetTripsUseCaseImplementation: GetTripsUseCase {
    
    func execute() -> AnyPublisher<[Trip], Error> {
        
        return repository.getTrips()
    }
}
