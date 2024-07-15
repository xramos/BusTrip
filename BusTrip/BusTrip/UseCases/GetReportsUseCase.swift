//
//  GetReportsUseCase.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation

protocol GetReportsUseCase {
    
    func execute() -> [Report]
}
