//
//  String+BusTrip.swift
//  BusTrip
//
//  Created by Xavier Ramos on 28/6/24.
//

import Foundation

extension String {
    
    var isBlank: Bool {
        return trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
    }
    
    func formatTime() -> String? {
        
        var formattedDate: String?
        
        let dateFormatter = DateFormatter.iso8601Full
        let customerFormatter = DateFormatter.shortTotalWithLocale
        
        if let dateFormatted = dateFormatter.date(from: self) {
            formattedDate = customerFormatter.string(from: dateFormatted)
        }
        
        return formattedDate
    }
}
