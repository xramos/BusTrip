//
//  GetReportsUseCase.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation

class GetReportsUseCase {
    
    private let repository: TripRepository
    
    init(repository: TripRepository = TripRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> [Report] {
        
        return repository.getReports()
    }
}
