//
//  TripRepositoryImplementationUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 26/6/24.
//

import XCTest
import Combine
@testable import BusTrip

final class TripRepositoryImplementationUnitTests: XCTestCase {

    var sut: TripRepositoryImplementation?
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com"
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
}

// MARK: - Get Trips

extension TripRepositoryImplementationUnitTests {
    
    func testGetTripsOK() {
        
        // Given
        let session = getTripsSession(statusCode: successStatusCode)
        
        let remote = RemoteTripDataSource(baseURLString: baseUrlString,
                                          session: session)
        
        sut = TripRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected trip values")
        
        // When
        cancellable = sut!.getTrips()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { trips in
                
                XCTAssertNotNil(trips)
                
                XCTAssertEqual(trips.count, 1)
                
                XCTAssertEqual(trips[0].driverName, "Bruce Wayne")
                XCTAssertEqual(trips[0].status, Status.ongoing)
                XCTAssertEqual(trips[0].route, "1")
                XCTAssertEqual(trips[0].startTime, "2018-12-18T08:00:00.000Z")
                XCTAssertEqual(trips[0].endTime, "2018-12-18T09:00:00.000Z")
                XCTAssertEqual(trips[0].description, "Visit Gotham City")
                
                XCTAssertNotNil(trips[0].origin)
                XCTAssertEqual(trips[0].origin.address, "Barcelona")
                
                XCTAssertNotNil(trips[0].destination)
                XCTAssertEqual(trips[0].destination.address, "Gotham")
                
                XCTAssertEqual(trips[0].stops.count, 0)
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetTripsKO() {
        
        // Given
        let session = getTripsSession(statusCode: failureStatusCode)
        
        let remote = RemoteTripDataSource(baseURLString: baseUrlString,
                                          session: session)
        
        sut = TripRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected trip values")
        
        // When
        cancellable = sut!.getTrips()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { _ in
                
                // Nothing to do
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

// MARK: - Get Stop Detail

extension TripRepositoryImplementationUnitTests {
 
    func testGetStopDetailOK() {
        
        // Given
        let stopId = 1
        let session = getStopDetailSession(statusCode: successStatusCode, stopId: stopId)
        
        let remote = RemoteTripDataSource(baseURLString: baseUrlString,
                                          session: session)
        
        sut = TripRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected trip values")
        
        // When
        cancellable = sut!.getStopDetail(stopId: stopId)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { stopDetail in
                
                XCTAssertNotNil(stopDetail)
                
                XCTAssertEqual(stopDetail.id, stopId)
                XCTAssertEqual(stopDetail.userName, "Bruce Wayne")
                XCTAssertEqual(stopDetail.address, "Gotham")
                XCTAssertEqual(stopDetail.stopTime, "2018-12-18T08:00:00.000Z")
                XCTAssertEqual(stopDetail.price, 2.5)
                XCTAssertEqual(stopDetail.paid, true)
                XCTAssertEqual(stopDetail.lat, 41.3)
                XCTAssertEqual(stopDetail.lon, 2.189)
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetStopDetailKO() {
     
        // Given
        let stopId = 1
        let session = getStopDetailSession(statusCode: failureStatusCode, stopId: stopId)
        
        let remote = RemoteTripDataSource(baseURLString: baseUrlString,
                                          session: session)
        
        sut = TripRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected trip values")
        
        // When
        cancellable = sut!.getStopDetail(stopId: stopId)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { _ in
                
                // Nothing to do
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

// MARK: - Session

fileprivate extension TripRepositoryImplementationUnitTests {
    
    func getTripsSession(statusCode: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "\(baseUrlString)/tech-test/trips.json")
        
        // data we expect to receive
        let data = getTripsData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and ceate the URLSession form that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getStopDetailSession(statusCode: Int, stopId: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "\(baseUrlString)/tech-test/stops.json")
        
        // data we expect to receive
        let data = getStopDetailData(stopId: stopId)
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and ceate the URLSession form that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getTripsData() -> Data {
        
        let dataString = """
                                     [{
                                        "driverName": "Bruce Wayne" ,
                                        "status": "ongoing",
                                        "route": "1",
                                        "startTime": "2018-12-18T08:00:00.000Z",
                                        "endTime": "2018-12-18T09:00:00.000Z",
                                        "description": "Visit Gotham City",
                                        "origin": {
                                            "address": "Barcelona",
                                            "point":  {
                                                "_latitude": 41.3,
                                                "_longitude": 2.189
                                            }
                                        },
                                        "destination": {
                                            "address": "Gotham",
                                            "point": {
                                                "_latitude": 42.466,
                                                "_longitude": 3.14
                                            }
                                        },
                                        "stops": []
                                    }]
                        """
        
        return Data(dataString.utf8)
    }
    
    func getStopDetailData(stopId: Int) -> Data {
        
        let dataString = """
                                     {
                                        "tripId": 1,
                                        "userName": "Bruce Wayne",
                                        "address": "Gotham",
                                        "stopTime": "2018-12-18T08:00:00.000Z",
                                        "price": 2.5,
                                        "paid": true,
                                        "point":  {
                                            "_latitude": 41.3,
                                            "_longitude": 2.189
                                        }
                                    }
                        """
        
        return Data(dataString.utf8)
    }
}
