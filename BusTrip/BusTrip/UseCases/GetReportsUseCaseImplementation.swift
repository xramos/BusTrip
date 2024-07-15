//
//  GetReportsUseCaseImplementation.swift
//  BusTrip
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation

class GetReportsUseCaseImplementation {
    
    private let repository: TripRepository
    
    init(repository: TripRepository = TripRepositoryImplementation()) {
        
        self.repository = repository
    }
}

extension GetReportsUseCaseImplementation: GetReportsUseCase {
    
    func execute() -> [Report] {
        
        return repository.getReports()
    }
}
