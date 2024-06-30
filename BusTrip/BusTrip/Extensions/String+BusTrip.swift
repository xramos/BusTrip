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
}
