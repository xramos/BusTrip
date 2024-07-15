//
//  TripListViewModelUnitTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 27/6/24.
//

import XCTest

@testable import BusTrip

final class TripListViewModelUnitTests: XCTestCase {

    var sut: TripListViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = TripListViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testIsSelectedOK() {

        // Given
        let trip = TripMock().generateTrip()
        sut?.selectedTrip = trip
        sut?.trips = [trip]
        
        // When
        let response = sut?.isSelected(trip: trip)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertTrue(response!)
    }

    func testIsSelectedKO() {

        // Given
        let trip1 = TripMock().generateTrip()
        let trip2 = TripMock().generateTrip()
        sut?.selectedTrip = trip1
        
        // When
        let response = sut?.isSelected(trip: trip2)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertFalse(response!)
    }

    func testGetTripRouteOK() {
        
        // Given
        let trip = TripMock().generateTrip(route: "sdq{Fc}iLj@zR|W~TryCzvC??do@jkKeiDxjIccLhiFqiE`uJqe@rlCy~B`t@sK|i@")
        
        // When
        let response = sut?.getTripRoute(trip: trip)
        
        // Then
        XCTAssertNotNil(response)
    }
    
    func testGetTripRouteKO() {
        
        // Given
        let trip = TripMock().generateTrip()
        
        // When
        let response = sut?.getTripRoute(trip: trip)
        
        // Then
        XCTAssertNil(response)
    }
    
    func testGetTripsCalled() {
        
        // Given
        let useCase = MockGetTripsUseCase()
        sut = TripListViewModel(getTripsUseCase: useCase)
        
        // When
        sut?.getTrips()
        
        // Then
        XCTAssertTrue(useCase.isExecuteCalled)
    }
    
    func testGetStopDetailCalled() {
        
        // Given
        let useCase = MockGetStopDetailUseCase()
        sut = TripListViewModel(getStopDetailUseCase: useCase)
        
        // When
        sut?.getStopDetail(stopId: 1)
        
        // Then
        XCTAssertTrue(useCase.isExecuteCalled)
    }
}
