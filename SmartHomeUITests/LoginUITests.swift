//
//  SmartHomeUITests.swift
//  SmartHomeUITests
//
//  Created by Goga Barabadze on 03.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import XCTest
@testable import Smart_Home

class LoginUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
    }
    
//    func testLogin() throws {
//
//        let app = XCUIApplication()
//        app.launch()
//
//        // Networking.signOut()
//
//        app.buttons.containing(.staticText, identifier:"Login").element.tap()
//        app.navigationBars["Login"].buttons["Login"].tap()
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
