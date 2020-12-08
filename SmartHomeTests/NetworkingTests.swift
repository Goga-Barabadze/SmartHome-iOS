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
    private let locationID = "iQPYVxHRAuqZpdiaTn7B"
    private let consumerType = "XTEKNDUF"
    private let email = "fakeemail@something.com"
    private let password = "gogagoga"


    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    // MARK: Get Functions

    func testGetFroniusLocation() throws {
        
        let expectation = self.expectation(description: "testGetFroniusLocation")
        
        let parameters: [String : Any] = [
            "pvID": pvID
        ]
        
        Networking.call(function: "getFroniusLocation", with: parameters) { result, error in
            
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
        
        let parameters: [String : Any] = [
            "email": email
        ]
        
        Networking.call(function: "getLocations", with: parameters) { result, error in
            
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
    
    // Warning: Could fail if Fronius API is down
    func testGetPVData() throws {
        
        let expectation = self.expectation(description: "testGetPVData")
        
        let parameters: [String : Any] = [
            "pvID": pvID
        ]
        
        Networking.call(function: "getPVData", with: parameters) { result, error in
            
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
        
        let parameters: [String : Any] = [
            "city": "Perg"
        ]
        
        Networking.call(function: "getWeather", with: parameters) { result, error in
            
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
        
        let parameters: [String : Any] = [
            "city": "Perg"
        ]
        
        Networking.call(function: "getForecast", with: parameters) { result, error in
            
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
        
        let parameters: [String : Any] = [
            "companyID": compandyID
        ]
        
        Networking.call(function: "getPossibleConsumers", with: parameters) { result, error in
            
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
        
        let parameters: [String : Any] = [
            "email" : "fakeemail@something.com",
            "locationID" : "iQPYVxHRAuqZpdiaTn7B"
        ]
        
        Networking.call(function: "getConsumers", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result as? [String : Any] {
                
                print(result)
                
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
        
        let parameters: [String : Any] = [
            "consumerType": consumerType
        ]
        
        Networking.call(function: "getConsumerData", with: parameters) { result, error in
            
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
    
    // MARK: Add Functions
    
    func testAddPV() throws {
        
        let expectation = self.expectation(description: "testAddPV")
        
        let parameters: [String : Any] = [
            "email": email,
            "locationID": locationID,
            "pvID": pvID
        ]
        
        Networking.call(function: "addPV", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertEqual(result["message"] as? String, "Successful")
                
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
    
    func testAddConsumer() throws {
        
        let expectation = self.expectation(description: "testAddConsumer")
        
        let parameters: [String : Any] = [
            "email": email,
            "locationID": locationID,
            "companyName": "companyName",
            "consumerName": "consumerName",
            "consumerType": "consumerType",
            "consumerSerial": "consumerSerial",
            "averageConsumption": "averageConsumption",
            "state": "state"
        ]
        
        Networking.call(function: "addConsumer", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["state"])
                XCTAssertNotNil(result["consumerID"])
                
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
    
    func testAddLocation() throws {
        
        let expectation = self.expectation(description: "testAddLocation")
        
        let parameters: [String : Any] = [
            "email": email,
            "name": "Test Location",
            "zip": "4320",
            "city": "Perg",
            "country": "Austria"
        ]
        
        Networking.call(function: "addLocation", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
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
    
    // MARK: Update Functions
    
    
    
    // MARK: Miscellaneous Tests
    
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
