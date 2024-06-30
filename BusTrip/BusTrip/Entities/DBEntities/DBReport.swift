//
//  DBReport.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation

extension DBReport {
    
    func convertToEntity() -> Report {
        
        return Report(name: name ?? "",
                      surname: surname ?? "",
                      email: email ?? "",
                      phone: phone,
                      reportTime: reportTime ?? "",
                      reportDescription: reportDescription ?? "")
    }
}
