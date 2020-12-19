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
    
    private let pvID = "f5b8a9f8-9432-47fe-9875-3030bf74e92f"
    private let maximumWaitForExpectation = 10
    private let compandyID = "pVw6UrCyUSbgyAqXI9rV"
    private let locationID = "1iXbFbWvzoiyUU7LXlgO"
    private let consumerID = "3WAyPPXhpSXMpV4oQNkX"
    private let consumerType = "XTEKNDUF"
    private let consumerSerial = "Serial"
    private let consumerState = "RUNNING"
    private let generatorType = "Fronius"
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
    
    func testGetGenerators() throws {
        
        let expectation = self.expectation(description: "testGetGenerators")
        
        let parameters: [String : Any] = [
            "email" : "fakeemail@something.com",
            "locationID" : "iQPYVxHRAuqZpdiaTn7B"
        ]
        
        Networking.call(function: "getGenerators", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error.debugDescription))")
            }
            
            if let result = result as? [String : Any] {
                
                XCTAssertNotNil(result["Generators"])
                
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
            "email" : email,
            "locationID" : locationID
        ]
        
        Networking.call(function: "getConsumers", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error.debugDescription))")
            }
            
            if let result = result as? [String : Any] {
                
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
            "averageConsumption": 0,
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
                
                let deleteLocationParameters: [String : Any] = [
                    "email": self.email,
                    "locationID": result["locationID"]!
                ]
                
                Networking.call(function: "deleteLocation", with: deleteLocationParameters) { (result, error) in
                    
                    expectation.fulfill()
                }
                
            } else {
                XCTFail("Error: Result is nil.")
            }
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: Update Functions
    
    func testUpdateState() throws {
        
        let expectation = self.expectation(description: "testUpdateState")
        
        let parameters: [String : Any] = [
            "email": email,
            "locationID": locationID,
            "consumerID": consumerID,
            "modus": "START",
            "pvID": pvID
        ]
        
        Networking.call(function: "updateState", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["consumerState"])
                
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
    
    func testUpdateLocation() throws {
        let expectation = self.expectation(description: "testUpdateLocation")
        
        let parameters: [String : Any] = [
            "email": email,
            "city": "Perg",
            "zip": "4320",
            "country": "Austria",
            "name": "Goga's wonderful lil test",
            "locationID": locationID
        ]
        
        Networking.call(function: "updateLocation", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["message"])
                
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
    
    func testUpdateGenerator() throws {
        let expectation = self.expectation(description: "testUpdateGenerator")
        
        let parameters: [String : Any] = [
            "email": email,
            "type": generatorType,
            "locationID": locationID,
            "pvID": pvID
        ]
        
        Networking.call(function: "updateGenerator", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["message"])
                
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
    
    func testUpdateConsumer() throws {
        
        let expectation = self.expectation(description: "testUpdateConsumer")
        
        let parameters: [String : Any] = [
            "email": email,
            "type": consumerType,
            "consumerID": consumerID,
            "serial": consumerSerial,
            "state": consumerState,
            "company": compandyID,
            "name": "Gustav",
            "averageConsumption": Double.random(in: 0...100),
            "locationID": locationID,
            "pvID": pvID
        ]
        
        Networking.call(function: "updateConsumer", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["message"])
                
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
    
    // MARK: Delete Tests
    
    func testDeleteLocation() throws {
        
        let expectation = self.expectation(description: "testDeleteLocation")
        
        // Create a location to delete it afterwards
        
        let addLocationParameters: [String : Any] = [
            "email": email,
            "name": "Test Location",
            "zip": "4320",
            "city": "Perg",
            "country": "Austria"
        ]
        
        Networking.call(function: "addLocation", with: addLocationParameters) { (result, error) in
            
            // Get generated locationID
            guard let locationID = (result! as? [String : Any])?["locationID"] else {
                XCTFail()
                return
            }
            
            // Delete it
            let deleteLocationParameters: [String : Any] = [
                "email": self.email,
                "locationID": locationID
            ]
            
            Networking.call(function: "deleteLocation", with: deleteLocationParameters) { (resultOfDelete, errorOfDelete) in
                
                if errorOfDelete != nil {
                    XCTFail("Error: \(String(describing: errorOfDelete?.localizedDescription))")
                }
                
                if let result = resultOfDelete! as? [String : Any] {
                    
                    XCTAssertNotNil(result["message"])
                    
                } else {
                    XCTFail("Error: Result is nil.")
                }
                
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteGenerator() throws {
        let expectation = self.expectation(description: "testDeleteGenerator")
        
        // Create a generator to delete it afterwards
        let temporaryPVID = "delete-me"
        
        let addPVParameters: [String : Any] = [
            "email": email,
            "locationID": locationID,
            "pvID": temporaryPVID
        ]
        
        Networking.call(function: "addPV", with: addPVParameters) { (result, error) in
            
            // Delete it
            let deleteGeneratorParameters: [String : Any] = [
                "email": self.email,
                "locationID": self.locationID,
                "pvID": temporaryPVID
            ]
            
            Networking.call(function: "deleteGenerator", with: deleteGeneratorParameters) { (resultOfDelete, errorOfDelete) in
                
                if errorOfDelete != nil {
                    XCTFail("Error: \(String(describing: errorOfDelete?.localizedDescription))")
                }
                
                if let result = resultOfDelete! as? [String : Any] {
                    
                    XCTAssertNotNil(result["message"])
                    
                } else {
                    XCTFail("Error: Result is nil.")
                }
                
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteConsumer() throws {
        let expectation = self.expectation(description: "testDeleteConsumer")
        
        // Create a consumer to delete it afterwards
        let addConsumerParameters: [String : Any] = [
            "email": email,
            "locationID": locationID,
            "companyName": "companyName",
            "consumerName": "consumerName",
            "consumerType": "consumerType",
            "consumerSerial": "consumerSerial",
            "averageConsumption": 0,
            "state": "state"
        ]
        
        Networking.call(function: "addConsumer", with: addConsumerParameters) { (result, error) in
            
            // Get generated locationID
            guard let consumerID = (result! as? [String : Any])?["consumerID"] else {
                XCTFail()
                return
            }
            
            // Delete it
            let deleteConsumerParameters: [String : Any] = [
                "email": self.email,
                "locationID": self.locationID,
                "consumerID": consumerID
            ]
            
            Networking.call(function: "deleteConsumer", with: deleteConsumerParameters) { (resultOfDelete, errorOfDelete) in
                
                if errorOfDelete != nil {
                    XCTFail("Error: \(String(describing: errorOfDelete?.localizedDescription))")
                }
                
                if let result = resultOfDelete! as? [String : Any] {
                    
                    XCTAssertNotNil(result["message"])
                    
                } else {
                    XCTFail("Error: Result is nil.")
                }
                
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: Account Tests
    
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
    
    func testUpdateUserPassword() throws {
        
        let expectation = self.expectation(description: "testUpdateUserPassword")
        
        var parameters: [String : Any] = [
            "email": email,
            "password": "DiesesPasswordWirdGleichWiederZurückgesetzt"
        ]
        
        Networking.call(function: "updateUserPassword", with: parameters) { result, error in
            
            if error != nil {
                XCTFail("Error: \(String(describing: error?.localizedDescription))")
            }
            
            if let result = result! as? [String : Any] {
                
                XCTAssertNotNil(result["message"])
                
                // Put the old password back in now
                parameters["password"] = self.password
                
                Networking.call(function: "updateUserPassword", with: parameters) { (result, error) in
                    expectation.fulfill()
                }
                
            } else {
                XCTFail("Error: Result is nil.")
            }
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
    }
}
