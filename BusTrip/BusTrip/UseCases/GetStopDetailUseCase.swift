//
//  GetStopDetailUseCase.swift
//  BusTrip
//
//  Created by Xavier Ramos on 27/6/24.
//

import Foundation
import Combine

protocol GetStopDetailUseCase {
    
    func execute(stopId: Int) -> AnyPublisher<StopDetail, Error>
}
