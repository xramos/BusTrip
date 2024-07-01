//
//  ReportDatePickerSnapshotTests.swift
//  BusTripTests
//
//  Created by Xavier Ramos on 30/6/24.
//

import XCTest
import PreviewSnapshotsTesting

@testable import BusTrip

final class ReportDatePickerSnapshotTests: XCTestCase {

    func test_snapshots() {
        
        ReportDatePicker_Previews.snapshots.assertSnapshots(as: .image(perceptualPrecision: 0.98,
                                                                       layout: .device(config: .iPhoneX(.portrait))))
    }
}
