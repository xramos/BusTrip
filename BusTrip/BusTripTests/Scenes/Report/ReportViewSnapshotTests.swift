//
//  ReportViewSnapshotTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 30/6/24.
//

import XCTest
import PreviewSnapshotsTesting

@testable import BusTrip

final class ReportViewSnapshotTests: XCTestCase {

    func test_snapshots() {
        
        // isRecording = true
        ReportView_Previews.snapshots.assertSnapshots(as:
                .image(perceptualPrecision: 0.98, layout: .device(config: .iPhoneX(.portrait)))
        )
    }
}
