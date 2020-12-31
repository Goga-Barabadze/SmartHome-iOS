//
//  NetworkingTests.swift
//  SmartHomeTests
//
//  Created by Goga Barabadze on 20.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import XCTest
@testable import Smart_Home

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
        
        Networking.getFroniusLocation(pvID: pvID) { (location) in
            
            XCTAssertNotNil(location)
            XCTAssertNotNil(location?.id)
            
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
        
        Networking.getLocations(email: email) { (locations) in
            
            XCTAssertNotNil(locations)
            XCTAssertNotNil(locations?.first)
            XCTAssertNotNil(locations?.first?.id)
            
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
        
        Networking.getGeneratorData(pvID: pvID) { (generatorData) in
            
            XCTAssertNotNil(generatorData)
            XCTAssertNotNil(generatorData?.first)
            XCTAssertNotNil(generatorData?.first?.value)
            
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
        
        Networking.getWeather(city: "Linz") { (weather) in
            
            XCTAssertNotNil(weather)
            XCTAssertNotNil(weather?.datetime)
            XCTAssertNotNil(weather?.temperature)
            
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
        
        Networking.getForecast(city: "Perg") { (forecast) in
            
            XCTAssertNotNil(forecast)
            XCTAssertNotNil(forecast?.first)
            XCTAssertNotNil(forecast?.first?.datetime)
            
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetPossibleCompanies() throws {
        
        let expectation = self.expectation(description: "testGetPossibleCompanies")
        
        Networking.getPossibleCompanies { (companies) in
            
            XCTAssertNotNil(companies)
            XCTAssertNotNil(companies?.first)
            XCTAssertNotNil(companies?.first?.id)
            
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
        
        Networking.getPossibleConsumers(companyID: compandyID) { (consumers) in
            
            XCTAssertNotNil(consumers)
            XCTAssertNotNil(consumers?.first)
            XCTAssertNotNil(consumers?.first?.id)
            
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
        
        Networking.getGenerators(email: email, locationID: locationID) { (generators) in
            
            XCTAssertNotNil(generators)
            XCTAssertNotNil(generators?.first)
            XCTAssertNotNil(generators?.first?.id)
            
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
        
        Networking.getConsumers(email: email, locationID: locationID) { (consumers) in
            
            XCTAssertNotNil(consumers)
            XCTAssertNotNil(consumers?.first)
            XCTAssertNotNil(consumers?.first?.id)
            XCTAssertNotNil(consumers?.first?.averageConsumption)
            
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
        
        Networking.getConsumerData(consumerType: consumerType) { (consumerData) in
            
            XCTAssertNotNil(consumerData)
            XCTAssertNotNil(consumerData?.first)
            XCTAssertNotNil(consumerData?.first?.consumption)
            
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
        
        Networking.addPV(email: email, locationID: locationID, pvID: pvID) { (didSucceed) in
            
            XCTAssertTrue(didSucceed)
            
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
        
        let consumer = Consumer(id: consumerID, averageConsumption: 1.0, company: "", name: "", serial: consumerSerial, state: .not_running, type: consumerType)
        
        Networking.addConsumer(email: email, locationID: locationID, consumer: consumer) { (state, consumerID) in
            
            XCTAssertNotNil(state)
            XCTAssertNotNil(consumerID)
            
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
   
//    func testAddLocation() throws {
//
//        let expectation = self.expectation(description: "testAddLocation")
//
//        let parameters: [String : Any] = [
//            "email": email,
//            "name": "Test Location",
//            "zip": "4320",
//            "city": "Perg",
//            "country": "Austria"
//        ]
//
//        Networking.call(function: .addLocation, with: parameters) { result, error in
//
//            if error != nil {
//                XCTFail("Error: \(String(describing: error?.localizedDescription))")
//            }
//
//            if let result = result! as? [String : Any] {
//
//                XCTAssertNotNil(result["locationID"])
//
//                let deleteLocationParameters: [String : Any] = [
//                    "email": self.email,
//                    "locationID": result["locationID"]!
//                ]
//
//                Networking.call(function: .deleteLocation, with: deleteLocationParameters) { (result, error) in
//
//                    expectation.fulfill()
//                }
//
//            } else {
//                XCTFail("Error: Result is nil.")
//            }
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    // MARK: Update Functions
//
//    func testUpdateState() throws {
//
//        let expectation = self.expectation(description: "testUpdateState")
//
//        let parameters: [String : Any] = [
//            "email": email,
//            "locationID": locationID,
//            "consumerID": consumerID,
//            "modus": "START",
//            "pvID": pvID
//        ]
//
//        Networking.call(function: .updateState, with: parameters) { result, error in
//
//            if error != nil {
//                XCTFail("Error: \(String(describing: error?.localizedDescription))")
//            }
//
//            if let result = result! as? [String : Any] {
//
//                XCTAssertNotNil(result["consumerState"])
//
//            } else {
//                XCTFail("Error: Result is nil.")
//            }
//
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func testUpdateLocation() throws {
//        let expectation = self.expectation(description: "testUpdateLocation")
//
//        let parameters: [String : Any] = [
//            "email": email,
//            "city": "Perg",
//            "zip": "4320",
//            "country": "Austria",
//            "name": "Goga's wonderful lil test",
//            "locationID": locationID
//        ]
//
//        Networking.call(function: .updateLocation, with: parameters) { result, error in
//
//            if error != nil {
//                XCTFail("Error: \(String(describing: error?.localizedDescription))")
//            }
//
//            if let result = result! as? [String : Any] {
//
//                XCTAssertNotNil(result["message"])
//
//            } else {
//                XCTFail("Error: Result is nil.")
//            }
//
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func testUpdateGenerator() throws {
//        let expectation = self.expectation(description: "testUpdateGenerator")
//
//        let parameters: [String : Any] = [
//            "email": email,
//            "type": generatorType,
//            "locationID": locationID,
//            "pvID": pvID
//        ]
//
//        Networking.call(function: .updateGenerator, with: parameters) { result, error in
//
//            if error != nil {
//                XCTFail("Error: \(String(describing: error?.localizedDescription))")
//            }
//
//            if let result = result! as? [String : Any] {
//
//                XCTAssertNotNil(result["message"])
//
//            } else {
//                XCTFail("Error: Result is nil.")
//            }
//
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func testUpdateConsumer() throws {
//
//        let expectation = self.expectation(description: "testUpdateConsumer")
//
//        let parameters: [String : Any] = [
//            "email": email,
//            "type": consumerType,
//            "consumerID": consumerID,
//            "serial": consumerSerial,
//            "state": consumerState,
//            "company": compandyID,
//            "name": "Gustav",
//            "averageConsumption": Double.random(in: 0...100),
//            "locationID": locationID,
//            "pvID": pvID
//        ]
//
//        Networking.call(function: .updateConsumer, with: parameters) { result, error in
//
//            if error != nil {
//                XCTFail("Error: \(String(describing: error?.localizedDescription))")
//            }
//
//            if let result = result! as? [String : Any] {
//
//                XCTAssertNotNil(result["message"])
//
//            } else {
//                XCTFail("Error: Result is nil.")
//            }
//
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    // MARK: Delete Tests
//
//    func testDeleteLocation() throws {
//
//        let expectation = self.expectation(description: "testDeleteLocation")
//
//        // Create a location to delete it afterwards
//
//        let addLocationParameters: [String : Any] = [
//            "email": email,
//            "name": "Test Location",
//            "zip": "4320",
//            "city": "Perg",
//            "country": "Austria"
//        ]
//
//        Networking.call(function: .addLocation, with: addLocationParameters) { (result, error) in
//
//            // Get generated locationID
//            guard let locationID = (result! as? [String : Any])?["locationID"] else {
//                XCTFail()
//                return
//            }
//
//            // Delete it
//            let deleteLocationParameters: [String : Any] = [
//                "email": self.email,
//                "locationID": locationID
//            ]
//
//            Networking.call(function: .deleteLocation, with: deleteLocationParameters) { (resultOfDelete, errorOfDelete) in
//
//                if errorOfDelete != nil {
//                    XCTFail("Error: \(String(describing: errorOfDelete?.localizedDescription))")
//                }
//
//                if let result = resultOfDelete! as? [String : Any] {
//
//                    XCTAssertNotNil(result["message"])
//
//                } else {
//                    XCTFail("Error: Result is nil.")
//                }
//
//                expectation.fulfill()
//            }
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func testDeleteGenerator() throws {
//        let expectation = self.expectation(description: "testDeleteGenerator")
//
//        // Create a generator to delete it afterwards
//        let temporaryPVID = "delete-me"
//
//        let addPVParameters: [String : Any] = [
//            "email": email,
//            "locationID": locationID,
//            "pvID": temporaryPVID
//        ]
//
//        Networking.call(function: .addPV, with: addPVParameters) { (result, error) in
//
//            // Delete it
//            let deleteGeneratorParameters: [String : Any] = [
//                "email": self.email,
//                "locationID": self.locationID,
//                "pvID": temporaryPVID
//            ]
//
//            Networking.call(function: .deleteGenerator, with: deleteGeneratorParameters) { (resultOfDelete, errorOfDelete) in
//
//                if errorOfDelete != nil {
//                    XCTFail("Error: \(String(describing: errorOfDelete?.localizedDescription))")
//                }
//
//                if let result = resultOfDelete! as? [String : Any] {
//
//                    XCTAssertNotNil(result["message"])
//
//                } else {
//                    XCTFail("Error: Result is nil.")
//                }
//
//                expectation.fulfill()
//            }
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func testDeleteConsumer() throws {
//        let expectation = self.expectation(description: "testDeleteConsumer")
//
//        // Create a consumer to delete it afterwards
//        let addConsumerParameters: [String : Any] = [
//            "email": email,
//            "locationID": locationID,
//            "companyName": "companyName",
//            "consumerName": "consumerName",
//            "consumerType": "consumerType",
//            "consumerSerial": "consumerSerial",
//            "averageConsumption": 0,
//            "state": "state"
//        ]
//
//        Networking.call(function: .addConsumer, with: addConsumerParameters) { (result, error) in
//
//            // Get generated locationID
//            guard let consumerID = (result! as? [String : Any])?["consumerID"] else {
//                XCTFail()
//                return
//            }
//
//            // Delete it
//            let deleteConsumerParameters: [String : Any] = [
//                "email": self.email,
//                "locationID": self.locationID,
//                "consumerID": consumerID
//            ]
//
//            Networking.call(function: .deleteConsumer, with: deleteConsumerParameters) { (resultOfDelete, errorOfDelete) in
//
//                if errorOfDelete != nil {
//                    XCTFail("Error: \(String(describing: errorOfDelete?.localizedDescription))")
//                }
//
//                if let result = resultOfDelete! as? [String : Any] {
//
//                    XCTAssertNotNil(result["message"])
//
//                } else {
//                    XCTFail("Error: Result is nil.")
//                }
//
//                expectation.fulfill()
//            }
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation * 2)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    // MARK: Account Tests
//
//    func testUpdateUserPassword() throws {
//
//        let expectation = self.expectation(description: "testUpdateUserPassword")
//
//        var parameters: [String : Any] = [
//            "email": email,
//            "password": "DiesesPasswordWirdGleichWiederZurückgesetzt"
//        ]
//
//        Networking.call(function: .updateUserPassword, with: parameters) { result, error in
//
//            if error != nil {
//                XCTFail("Error: \(String(describing: error?.localizedDescription))")
//            }
//
//            if let result = result! as? [String : Any] {
//
//                XCTAssertNotNil(result["message"])
//
//                // Put the old password back in now
//                parameters["password"] = self.password
//
//                Networking.call(function: .updateUserPassword, with: parameters) { (result, error) in
//                    expectation.fulfill()
//                }
//
//            } else {
//                XCTFail("Error: Result is nil.")
//            }
//
//        }
//
//        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
//            if let error = error {
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }
//
//    }

}
