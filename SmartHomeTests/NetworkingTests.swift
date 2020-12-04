//
//  NetworkingTests.swift
//  SmartHomeTests
//
//  Created by Goga Barabadze on 28.10.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import XCTest
@testable import Smart_Home

class NetworkingTests: XCTestCase {
    
    private let pvID = "6dd05177-193f-4580-97bd-3331e3abe530"
    private let maximumWaitForExpectation = 10

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testGetFroniusLocation() throws {
        
        let expectation = self.expectation(description: "testGetFroniusLocation")
        
        Networking.call(function: "getFroniusLocation", with: ["pvID": pvID]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result {
                
                XCTAssertNotNil(result["city"])
                XCTAssertNotNil(result["zip"])
                XCTAssertNotNil(result["country"])
                XCTAssertNotNil(result["name"])
                XCTAssertNotNil(result["locationID"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            XCTAssert(true)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetWeather() throws {
        
        let expectation = self.expectation(description: "testGetWeather")
        
        Networking.call(function: "getWeather", with: ["city": "Perg"]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result {
                
                XCTAssertNotNil(result["description"])
                XCTAssertNotNil(result["temp"])
                XCTAssertNotNil(result["sunset"])
                XCTAssertNotNil(result["sunrise"])
                XCTAssertNotNil(result["dt"])
                
                // MARK: TODO - Why are these two not in my results?
//                XCTAssertNotNil(result["temp_min"])
//                XCTAssertNotNil(result["temp_max"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            XCTAssert(true)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
}
