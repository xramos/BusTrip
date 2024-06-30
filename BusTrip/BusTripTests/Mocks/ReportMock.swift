//
//  ReportMock.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation

@testable import BusTrip

final class ReportMock {
    
    let name = "Bruce Wayne"
    let surname = "Batman"
    let email = "bruce@wayneenterprises.com"
    let phone = "654123789"
    let reportTime = "2018-12-18T08:00:00.000Z"
    let reportDescription = "Issues with Gotham bus trip"
    
    // MARK: - Report
    
    func generateReport(name: String? = nil,
                        surname: String? = nil,
                        email: String? = nil,
                        phone: String? = nil,
                        reportTime: String? = nil,
                        reportDescription: String? = nil) -> Report {
        
        return Report(name: name ?? self.name,
                      surname: surname ?? self.surname,
                      email: email ?? self.email,
                      phone: phone ?? self.phone,
                      reportTime: reportTime ?? self.reportTime,
                      reportDescription: reportDescription ?? self.reportDescription)
    }
    
    // MARK: - DBReport
    
    func generateDBReport(name: String? = nil,
                          surname: String? = nil,
                          email: String? = nil,
                          phone: String? = nil,
                          reportTime: String? = nil,
                          reportDescription: String? = nil) -> DBReport {
        
        let dbReport = DBReport(context: TestCoreDataStack().managedContext)
        
        dbReport.name = name ?? self.name
        dbReport.surname = surname ?? self.surname
        dbReport.email = email ?? self.email
        dbReport.phone = phone ?? self.phone
        dbReport.reportTime = reportTime ?? self.reportTime
        dbReport.reportDescription = reportDescription ?? self.reportDescription
        
        return dbReport
    }
}
