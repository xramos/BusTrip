//
//  LocalDataSource.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation

class LocalDataSource {
    
    private let dbManager: Persistence
    
    init(dbManager: Persistence = DBManager()) {
        
        self.dbManager = dbManager
    }
    
    func saveReport(report: Report) {
        
        dbManager.saveReport(report: report)
    }
}
