//
//  Persistence.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation

protocol Persistence {
    
    func getReports() -> [Report]
    
    func saveReport(report: Report)
}
