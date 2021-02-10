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
        
        let application = XCUIApplication()
        application.launchEnvironment = ["FORCESIGNOUT" : "true"]
        application.launch()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testThreeTabBarItems() {
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Login"].buttons["Login"].tap()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Stats."].tap()
        tabBar.buttons["Profile"].tap()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
