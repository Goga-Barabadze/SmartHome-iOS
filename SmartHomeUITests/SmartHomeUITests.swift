//
//  SmartHomeUITests.swift
//  SmartHomeUITests
//
//  Created by Goga Barabadze on 03.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import XCTest

class SmartHomeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
