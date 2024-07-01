//
//  Constants.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation

struct Constants {
    
    static let baseURL = "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com"
    
    // Images
    static let previewImage = "BusIcon"
    static let markerImage = "bus.fill"
    static let annotationImage = "figure.walk"
    
    // Latitude and longitude deltas
    static let latitudeDelta = 0.38
    static let longitudeDelta = 0.38
    
    // Paddings
    static let padding: CGFloat = 8
    static let paddingL: CGFloat = 16
    static let paddingXL: CGFloat =  30
    
    // Opacities
    static let opacity: CGFloat = 0.5
    
    // Corner Radius
    static let cornerRadius: CGFloat = 10
    
    // Border Radius
    static let borderRadius: CGFloat = 16
    
    // Line Width
    static let lineWidth: CGFloat = 8
    
    // Heights
    static let iconHeight: CGFloat = 24
    static let annotationHeight: CGFloat = 40
    static let previewIconHeight: CGFloat = 140
    static let tripListHeight: CGFloat = 240
}
