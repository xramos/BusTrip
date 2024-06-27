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
import CoreLocation
import MapKit

class TripListViewModel: ObservableObject {
    
    // Values
    
    @Published private(set) var state = State.idle
    @Published private(set) var trips: [Trip] = []
    @Published private(set) var selectedTrip: Trip?
    
    // Cancellables
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getTrips() {
        
        state = .loading
        
        cancellable = GetTripsUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    self.state = .loaded
                case .failure(let error):
                    self.state = .failed(error.localizedDescription)
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
}

extension TripListViewModel {
    
    // State
    
    enum State: Equatable {
        case idle
        case loading
        case failed(String)
        case loaded
    }
}
