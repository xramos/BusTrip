//
//  TripCardViewSnapshotTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 27/6/24.
//

import XCTest
import PreviewSnapshotsTesting

@testable import BusTrip

final class TripCardViewSnapshotTests: XCTestCase {

    func test_snapshots() {
        
        TripCardView_Previews.snapshots.assertSnapshots(as: .image(perceptualPrecision: 0.98, 
                                                                   layout: .device(config: .iPhoneX(.portrait))))
    }
}
