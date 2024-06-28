//
//  Constants.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct Constants {
    
    static let baseURL = "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com"
    
    static let previewImage = "BusIcon"
    static let markerImage = "bus.fill"
    static let annotationImage = "figure.walk"
    
    static let latitudeDelta = 0.38
    static let longitudeDelta = 0.38
    
    static let padding: CGFloat = 8
    static let paddingXL: CGFloat =  30
    
    static let cornerRadius: CGFloat = 10
    
    static let borderRadius: CGFloat = 16
    
    static let iconHeight: CGFloat = 24
    static let previewIconHeight: CGFloat = 200
    static let tripListHeight: CGFloat = 240
}
