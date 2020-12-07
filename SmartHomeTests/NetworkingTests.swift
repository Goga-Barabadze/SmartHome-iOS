//
//  NetworkingTests.swift
//  SmartHomeTests
//
//  Created by Goga Barabadze on 28.10.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import XCTest
@testable import Smart_Home
import FirebaseAuth

class NetworkingTests: XCTestCase {
    
    private let pvID = "6dd05177-193f-4580-97bd-3331e3abe530"
    private let maximumWaitForExpectation = 5
    private let compandyID = "pVw6UrCyUSbgyAqXI9rV"
    private let emailWithLocation = "sarahleosa@gmail.com"
    private let locationID = "6JiYw7mQna66xN7rxTH2"
    private let consumerType = "XTEKNDUF"
    private let email = "fakeemail@something.com"
    private let password = "gogagoga"


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
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["city"])
                XCTAssertNotNil(result["zip"])
                XCTAssertNotNil(result["country"])
                XCTAssertNotNil(result["name"])
                XCTAssertNotNil(result["locationID"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetLocations() throws {
        
        let expectation = self.expectation(description: "testGetLocations")
        
        Networking.call(function: "getLocations", with: ["email": emailWithLocation]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = ((((result! as? [String : Any])?["Locations"] as? NSArray)?.firstObject) as? [String : Any])?["Location"] as? [String : Any] {
                
                XCTAssertNotNil(result["city"])
                XCTAssertNotNil(result["country"])
                XCTAssertNotNil(result["zip"])
                XCTAssertNotNil(result["name"])
                XCTAssertNotNil(result["locationID"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetPVData() throws {
        
        let expectation = self.expectation(description: "testGetPVData")
        
        Networking.call(function: "getPVData", with: ["pvID": pvID]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["PVData"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
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
            
            if let result = result! as? [String : Any] {
                
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
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetForecast() throws {
        
        let expectation = self.expectation(description: "testGetForecast")
        
        Networking.call(function: "getForecast", with: ["city": "Perg"]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = ((result! as? [String : Any])?.first?.value as? NSArray)?.firstObject as? [String : Any] {
                
                XCTAssertNotNil(result["dt"])
                XCTAssertNotNil(result["temp"])
                XCTAssertNotNil(result["description"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetPossibleCompanies() throws {
        
        let expectation = self.expectation(description: "getPossibleCompanies")
        
        Networking.call(function: "getPossibleCompanies", with: nil) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["Companies"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetPossibleConsumers() throws {
        
        let expectation = self.expectation(description: "testGetPossibleConsumers")
        
        Networking.call(function: "getPossibleConsumers", with: ["companyID": compandyID]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["Consumers"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetConsumers() throws {
        
        let expectation = self.expectation(description: "testGetConsumers")
        
        Networking.call(function: "getPossibleConsumers", with: ["email": email, "locationID": locationID]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["Consumers"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // TODO: Add test for getGenerators
    
    func testGetConsumerData() throws {
        
        let expectation = self.expectation(description: "testGetConsumerData")
        
        Networking.call(function: "getConsumerData", with: ["consumerType": consumerType]) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = ((result! as? [String : Any])?["Consumers"] as? NSArray)?.firstObject as? [String : Any] {
                
                XCTAssertNotNil(result["state"])
                XCTAssertNotNil(result["type"])
                XCTAssertNotNil(result["consumption"])
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testProperSignInAndSignOff() throws {
        
        let expectation = self.expectation(description: "testProperSignInAndSignOff")
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                XCTFail(error.debugDescription)
            }
            
            XCTAssertEqual(Networking.isLoggedIn(), true)
            
            Networking.signOut()
            XCTAssertEqual(Networking.isLoggedIn(), false)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
}
