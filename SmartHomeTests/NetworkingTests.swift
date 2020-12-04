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

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testGetFroniusLocation() throws {
        
        let expectation = self.expectation(description: "testGetFroniusLocation")
        
        Networking.call(function: "getFroniusLocation", with: ["email" : "test", "pvID": "6dd05177-193f-4580-97bd-3331e3abe530"]) { result, error in
            
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
        
        waitForExpectations(timeout: TimeInterval(10)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
}
