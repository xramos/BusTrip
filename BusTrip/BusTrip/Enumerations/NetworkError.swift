//
//  NetworkError.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

enum NetworkError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
