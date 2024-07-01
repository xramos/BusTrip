//
//  RemoteTripDataSource.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import Combine

class RemoteTripDataSource {
    
    // URLs
    static let trips_UrlPath: String = "tech-test/trips.json"
    static let stopDetail_UrlPath: String = "tech-test/stops.json"
    
    // Variables
    
    private let baseURLString: String
    private let session: URLSession
    
    // MARK: - Methods
    
    init(baseURLString: String? = nil, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURLString ?? Constants.baseURL
        self.session = session
    }
    
    func getTrips() -> AnyPublisher<[ServerTrip], Error> {
        
        let networkManager = NetworkManager(baseURL: baseURLString,
                                            session: session)
        
        let urlRequest = makeGetTrips()
        
        return networkManager.performRequest(urlRequest: urlRequest)
    }
    
    func getStopDetail(stopId: Int) -> AnyPublisher<ServerStopDetail, Error> {
        
        let networkManager = NetworkManager(baseURL: baseURLString,
                                            session: session)
        
        let urlRequest = makeGetStopDetail(stopId: stopId)
        
        return networkManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: - Endpoints

extension RemoteTripDataSource {
    
    func makeGetTrips() -> URLRequest {
        
        let endpoint = String(format: "\(baseURLString)/\(RemoteTripDataSource.trips_UrlPath)")
        
        let url = URL(string: endpoint.filter { !$0.isWhitespace })
        
        let urlRequest = URLRequest(url: url!)
        
        return urlRequest
    }
    
    func makeGetStopDetail(stopId: Int) -> URLRequest {
        
        let endpoint = String(format: "\(baseURLString)/\(RemoteTripDataSource.stopDetail_UrlPath)")
        
        let url = URL(string: endpoint.filter { !$0.isWhitespace })
        
        let urlRequest = URLRequest(url: url!)
        
        return urlRequest
    }
}
