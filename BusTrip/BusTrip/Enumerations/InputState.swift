//
//  InputState.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import Foundation
import SwiftUI

enum InputState {
    
    case empty
    case focus
    
    var validationColor: Color {
        
        switch self {
        case .empty:
            return Color.clear
        case .focus:
            return Color.primaryBackground
        }
    }
}
