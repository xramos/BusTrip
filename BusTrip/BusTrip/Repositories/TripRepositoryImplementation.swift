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
    private let localDataSource: LocalDataSource
    
    init(remoteDataSource: RemoteTripDataSource = RemoteTripDataSource(),
         localDataSource: LocalDataSource = LocalDataSource()) {
        
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
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
    
    func getStopDetail(stopId: Int) -> AnyPublisher<StopDetail, Error> {
        
        return remoteDataSource.getStopDetail(stopId: stopId).map { serverStopDetail in
            
            return serverStopDetail.convertToEntity()
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getReports() -> [Report] {
        
        return localDataSource.getReports()
    }
    
    func saveReport(report: Report) {
        
        localDataSource.saveReport(report: report)
    }
}
