//
//  Trip.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct Trip: Identifiable {

    var id: String = UUID().uuidString
    
    let route: String
    let driverName: String
    let description: String
    let status: Status
    let startTime: String
    let endTime: String
    
    let origin: Address
    let destination: Address
    let stops: [Stop]
}

extension Trip {
    
    func formatTime(date: String) -> String? {
        
        var formattedDate: String?
        
        let dateFormatter = DateFormatter.iso8601Full
        let customerFormatter = DateFormatter.shortTotalWithLocale
        
        if let dateFormatted = dateFormatter.date(from: date) {
            formattedDate = customerFormatter.string(from: dateFormatted)
        }
        
        return formattedDate
    }
}
