//
//  GetTripsUseCase.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import Combine

protocol GetTripsUseCase {
    
    func execute() -> AnyPublisher<[Trip], Error>
}
