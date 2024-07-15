//
//  ReportViewModel.swift
//  BusTrip
//
//  Created by Xavier Ramos on 28/6/24.
//

import Foundation
import SwiftUI
import Combine

class ReportViewModel: ObservableObject {
 
    // Values
    let saveReportUseCase: SaveReportUseCase
    let getReportsUseCase: GetReportsUseCase
    
    @Published var nameInput = ""
    @Published var surnameInput = ""
    @Published var emailInput = ""
    @Published var phoneInput = ""
    @Published var date: Date
    @Published var reportDescription = ""
    
    var minimumDate: Date
    var maximumDate: Date
    var dateString: String
    
    var saveReportPublisher = PassthroughSubject<Bool, Never>()
    private var reportSaved = false {
        didSet {
            saveReportPublisher.send(reportSaved)
        }
    }
    
    // MARK: - Methods
    
    init(saveReportUseCase: SaveReportUseCase = SaveReportUseCaseImplementation(),
         getReportsUseCase: GetReportsUseCase = GetReportsUseCaseImplementation()) {
        
        self.saveReportUseCase = saveReportUseCase
        self.getReportsUseCase = getReportsUseCase
        
        let currentDate = Date()
        date = currentDate
        
        // minimum date 10 years ago
        minimumDate = Calendar.current.date(byAdding: .year, value: -10, to: currentDate) ?? currentDate
        maximumDate = currentDate
        
        let formatter = DateFormatter.shortTotalWithLocale
        dateString = formatter.string(from: currentDate)
    }
    
    func updateDateString() {
        
        let formatter = DateFormatter.shortTotalWithLocale
        dateString = formatter.string(from: date)
    }
    
    func isSaveButtonDisabled() -> Bool {
        
        return nameInput.isBlank 
        || surnameInput.isBlank
        || !isValid(email: emailInput)
        || dateString.isBlank
        || !isValid(description: reportDescription)
    }
    
    func saveReport() {
        
        let report = Report(name: nameInput,
                            surname: surnameInput,
                            email: emailInput,
                            phone: phoneInput,
                            reportTime: dateString,
                            reportDescription: reportDescription)
        
        saveReportUseCase.execute(report: report)
        
        // Update badge number
        let reports = getReportsUseCase.execute()
        UNUserNotificationCenter.current().setBadgeCount(reports.count)
        
        reportSaved = true
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
