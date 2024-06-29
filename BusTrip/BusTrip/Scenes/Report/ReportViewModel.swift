//
//  ReportViewModel.swift
//  BusTrip
//
//  Created by Xavier Ramos on 28/6/24.
//

import Foundation
import SwiftUI

class ReportViewModel: ObservableObject {
 
    // Values
    
    @Published var nameInput = ""
    @Published var surnameInput = ""
    @Published var emailInput = ""
    @Published var phoneInput = ""
    // Date
    // Time
    @Published var reportDescription = ""
    
    func isSaveButtonDisabled() -> Bool {
        
        return nameInput.isBlank || surnameInput.isBlank || !isValid(email: emailInput) || !isValid(description: reportDescription)
    }
    
    func saveReport() {
        
        // TODO: Handle reporTime
        let report = Report(name: nameInput,
                            surname: surnameInput,
                            email: emailInput,
                            phone: phoneInput,
                            reportTime: "",
                            reportDescription: reportDescription)
        
        SaveReportUseCase().execute(report: report)
        
        // Update badge number
        let reports = GetReportsUseCase().execute()
        UNUserNotificationCenter.current().setBadgeCount(reports.count)
    }
}

// MARK: - Private Methods

fileprivate extension ReportViewModel {
    
    func isValid(email: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func isValid(description: String) -> Bool {
        
        return !description.isBlank && description.count <= 200
    }
}
