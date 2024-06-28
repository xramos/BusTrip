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
    @Published var selectedStop: StopDetail?
    
    // Cancellables
    
    private var getTripsCancellable: AnyCancellable?
    private var getStopDetailCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getTrips() {
        
        getTripsCancellable = GetTripsUseCase().execute()
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
            })
    }
    
    func getStopDetail(stopId: Int) {
        
        getStopDetailCancellable = GetStopDetailUseCase().execute(stopId: stopId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
                
            }, receiveValue: { (stopDetail: StopDetail) in
                
                self.selectedStop = stopDetail
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
