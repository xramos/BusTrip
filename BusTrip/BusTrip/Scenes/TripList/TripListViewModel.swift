//
//  TripListViewModel.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import SwiftUI
import Combine
import Polyline
import MapKit

class TripListViewModel: ObservableObject {
    
    // Values
    
    @Published var trips: [Trip] = []
    @Published var selectedTrip: Trip?
    
    // Cancellables
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getTrips() {
        
        cancellable = GetTripsUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
                
            }, receiveValue: { (trips: [Trip]) in
                self.trips = trips
                if let trip = trips.first {
                    self.setSelectedTrip(trip: trip)
                }
            })
    }
    
    func isSelected(trip: Trip) -> Bool {
        
        return trip.id == selectedTrip?.id
    }
    
    func setSelectedTrip(trip: Trip) {
        
        selectedTrip = trip
    }
    
    func getTripRoute(trip: Trip) -> [CLLocationCoordinate2D]? {
        
        let polyline = Polyline(encodedPolyline: trip.route)
        let decodecCoordinates: [CLLocationCoordinate2D]? = polyline.coordinates
        
        return decodecCoordinates
    }
    
    func getMidCoordinate(trip: Trip) -> CLLocationCoordinate2D {
        
        let latitude = (trip.origin.lat + trip.destination.lat) / 2
        let longitude = (trip.origin.lon + trip.destination.lon) / 2
        
        return CLLocationCoordinate2D(latitude: latitude,
                                      longitude: longitude)
    }
}
