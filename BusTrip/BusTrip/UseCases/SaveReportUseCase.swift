//
//  SaveReportUseCase.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation

class SaveReportUseCase {
    
    private let repository: TripRepository
    
    init(repository: TripRepository = TripRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(report: Report) {
        
        repository.saveReport(report: report)
    }
}
