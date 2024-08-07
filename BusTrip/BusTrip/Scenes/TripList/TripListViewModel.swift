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
    
    let getTripsUseCase: GetTripsUseCase
    let getStopDetailUseCase: GetStopDetailUseCase
    
    @Published var trips: [Trip] = []
    @Published var selectedTrip: Trip?
    @Published var selectedStopId: Int?
    @Published var selectedStop: StopDetail?
    
    // Cancellables
    
    private var getTripsCancellable: AnyCancellable?
    private var getStopDetailCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init(getTripsUseCase: GetTripsUseCase = GetTripsUseCaseImplementation(),
         getStopDetailUseCase: GetStopDetailUseCase = GetStopDetailUseCaseImplementation()) {
        
        self.getTripsUseCase = getTripsUseCase
        self.getStopDetailUseCase = getStopDetailUseCase
    }
    
    func getTrips() {
        
        getTripsCancellable = getTripsUseCase.execute()
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
                    self.selectedTrip = trip
                }
            })
    }
    
    func selectStopDetail(stopId: Int) {
        
        if stopId == selectedStopId {
            
            // If already selected deselect it
            self.selectedStopId = nil
            self.selectedStop = nil
            
        } else {
            
            getStopDetail(stopId: stopId)
        }
    }
    
    func getStopDetail(stopId: Int) {
        
        getStopDetailCancellable = getStopDetailUseCase.execute(stopId: stopId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
                
            }, receiveValue: { (stopDetail: StopDetail) in
                
                self.selectedStopId = stopId
                self.selectedStop = stopDetail
            })
    }
    
    func isSelected(trip: Trip) -> Bool {
        
        return trip.id == selectedTrip?.id
    }
    
    func setSelectedTrip(trip: Trip) {
        
        selectedTrip = trip
    }
    
    func isSelected(stop: Stop) -> Bool {
        
        return stop.id == selectedStop?.id
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
