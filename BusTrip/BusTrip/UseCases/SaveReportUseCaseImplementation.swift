//
//  SaveReportUseCaseImplementation.swift
//  BusTrip
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation

class SaveReportUseCaseImplementation {
    
    private let repository: TripRepository
    
    init(repository: TripRepository = TripRepositoryImplementation()) {
        
        self.repository = repository
    }
}

extension SaveReportUseCaseImplementation: SaveReportUseCase {
   
    func execute(report: Report) {
        
        repository.saveReport(report: report)
    }
}
