//
//  TripRepositoryImplementation.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import Combine

class TripRepositoryImplementation {
    
    private let remoteDataSource: RemoteTripDataSource
    
    init(remoteDataSource: RemoteTripDataSource = RemoteTripDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - TripRepository

extension TripRepositoryImplementation: TripRepository {
    
    func getTrips() -> AnyPublisher<[Trip], Error> {
        
        return remoteDataSource.getTrips().map { serverTrips -> [Trip] in
            
            var trips: [Trip] = []
            
            for serverTrip in serverTrips {
                
                let trip = serverTrip.convertToEntity()
                
                trips.append(trip)
            }
            
            return trips
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
