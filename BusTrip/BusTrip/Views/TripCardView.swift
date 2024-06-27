//
//  TripCardView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import SwiftUI
import PreviewSnapshots

struct TripCardView: View {
    
    var trip: Trip
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    Text(trip.description)
                        .font(.headline)
                    
                    HStack {
                        
                        Image(systemName: "calendar.circle")
                            .frame(height: Constants.iconHeight)
                            .foregroundColor(Color.secondary)
                        
                        Text(trip.formatTime(date: trip.endTime) ?? "")
                            .font(.footnote)
                    }
                }
                
                Spacer()
                    
                Text(trip.status.displayValue)
                    .font(.caption)
            }
            .padding(Constants.padding)
            .background(Color.surface)
                   .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        }
    }
}

// MARK: - Previews

struct TripCardView_ColorScheme_Previews: PreviewProvider {
    
    static var previews: some View {
        
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
        
        ForEach(ColorScheme.allCases, id: \.self) {
            TripCardView(trip: trip).preferredColorScheme($0)
        }
    }
}

struct TripCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<Status> {
        
        PreviewSnapshots(configurations: [
            .init(name: "Ongoing", state: .ongoing),
            .init(name: "Cancelled", state: .cancelled),
            .init(name: "Scheduled", state: .scheduled),
            .init(name: "Finalized", state: .finalized)
        ], configure: { state in
            
            TripCardView(trip: Trip(route: "123",
                                    driverName: "Bruce Wayne",
                                    description: "Visit Gotham",
                                    status: state,
                                    startTime: "2024-12-18T08:00:00.000Z",
                                    endTime: "2024-12-18T09:00:00.000Z",
                                    origin: Address(address: "Barcelona",
                                                    lat: 43.424,
                                                    lon: 2.33),
                                    destination: Address(address: "Gotham",
                                                         lat: 45.66,
                                                         lon: 3.56),
                                    stops: []))
        })
    }
}
