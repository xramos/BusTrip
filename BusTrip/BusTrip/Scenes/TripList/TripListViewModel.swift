//
//  TripListViewModel.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import SwiftUI
import Combine

class TripListViewModel: ObservableObject {
    
    // Values
    
    @Published var state = State.idle
    @Published public private(set) var trips: [Trip] = []
    
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
            })
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
