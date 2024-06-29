//
//  DBManager.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation
import CoreData

class DBManager {
    
    // MARK: - Properties
    
    let coreDataStack: CoreDataStack
    
    // MARK: - Methods
    
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        
        self.coreDataStack = coreDataStack
    }
}

// MARK: - Persistence

extension DBManager: Persistence {
    
    func getReports() -> [Report] {
        
        var reports: [Report] = []
        
        let fetchRequest = NSFetchRequest<DBReport>(entityName: "DBReport")
        
        do {
            
            let dbReports = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbReport in dbReports {
                let report = dbReport.convertToEntity()
                reports.append(report)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return reports
    }
    
    func saveReport(report: Report) {
        
        let dbReport = DBReport(context: coreDataStack.managedContext)
        dbReport.name = report.name
        dbReport.surname = report.surname
        dbReport.email = report.email
        dbReport.phone = report.phone
        dbReport.reportTime = report.reportTime
        dbReport.reportDescription = report.reportDescription
        
        coreDataStack.saveContext()
    }
}
