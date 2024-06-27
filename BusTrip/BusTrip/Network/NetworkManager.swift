//
//  NetworkManager.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import Foundation
import Combine

class NetworkManager {
    
    // MARK: - Variables
    
    private var baseURL: URL
    private var session: URLSession
    
    // MARK: - Methods
    
    init(baseURL: String, session: URLSession = URLSession.shared) {
        
        self.baseURL = URL(string: baseURL)!
        self.session = session
    }
    
    func performRequest<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        
        return session.dataTaskPublisher(for: urlRequest)
            .mapError { $0 as Error }
            .tryMap { data, response -> Data in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                
                let statusCode = httpResponse.statusCode
                
                guard (200..<300).contains(statusCode) else {
                    throw NetworkError.invalidStatusCode
                }
                
                return data
            }
            .eraseToAnyPublisher()
            .flatMap { data -> AnyPublisher<T, Error> in
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                return Result.Publisher(data)
                    .setFailureType(to: Error.self)
                    .decode(type: T.self, decoder: decoder)
                    .eraseToAnyPublisher()
            }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
