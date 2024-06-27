//
//  Status.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

enum Status: String {
    
    case ongoing, scheduled, cancelled, finalized, unknown
    
    var displayValue: String {
        switch self {
        case .ongoing:
            return "On Going"
        case .scheduled:
            return "Scheduled"
        case .cancelled:
            return "Cancelled"
        case .finalized:
            return "Finalized"
        case .unknown:
            return ""
        }
    }
}
