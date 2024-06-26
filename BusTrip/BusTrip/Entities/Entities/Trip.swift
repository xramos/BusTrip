//
//  Trip.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct Trip {
    
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
