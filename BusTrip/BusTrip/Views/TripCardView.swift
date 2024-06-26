//
//  TripCardView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import SwiftUI

struct TripCardView: View {
    
    let trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text(trip.description)
                        .font(.headline)
                    
                    Text(trip.driverName)
                        .font(.subheadline)
                }
                
                Spacer()
                
                Text(trip.status.rawValue)
                    .font(.caption)
            }
            .padding(Constants.padding)
            .background(Color.surface)
                   .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        }
        .padding(.bottom, Constants.padding)
    }
}

#Preview {
    
    let trip = Trip(route: "123",
                    driverName: "Bruce Wayne",
                    description: "Visit Gotham",
                    status: .ongoing,
                    startTime: "2024-12-18T08:00:00.000Z",
                    endTime: "2024-12-18T09:00:00.000Z",
                    origin: Address(address: "Barcelona",
                                    lat: 43.424,
                                    lon: 2.33),
                    destination: Address(address: "Gotham",
                                         lat: 45.66,
                                         lon: 3.56),
                    stops: [])
    
    return TripCardView(trip: trip)
}
