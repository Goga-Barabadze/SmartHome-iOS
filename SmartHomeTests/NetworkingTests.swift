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
    private let consumerID = "eicvFogRoDJYNyfH0EfM"
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

    func testLoadLocationsWithDepth() throws {
        
        let expectation = self.expectation(description: "testLoadLocationsWithDepth")
        
        Networking.loadLocationsWithDepth(email: email) { (locations) in
            
            XCTAssertNotEqual(locations.first?.weather.description, "")
            
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
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
    
    func testGetGeneratorData() throws {
        
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
            XCTAssertNotEqual(weather?.description, "")
            
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
            XCTAssertNotNil(consumers?.first?.consumption)
            
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
            
            Networking.deleteConsumer(email: self.email, locationID: self.locationID, consumerID: consumerID!) { (didSucceed) in
                
                XCTAssertTrue(didSucceed)
                
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testAddLocation() throws {
        
        let expectation = self.expectation(description: "testAddLocation")
        
        let location = Location(id: "", city: "Linz", country: "Austria", name: "Name of Location", zip: "2123")
        
        Networking.addLocation(email: email, location: location) { (locationID) in
            
            XCTAssertNotNil(locationID)
            
            guard let id = locationID else {
                XCTFail()
                return
            }
            
            Networking.deleteLocation(email: self.email, locationID: id) { (didSucceed) in
                
                expectation.fulfill()
                
            }
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: Update Functions

    func testUpdateState() throws {
        
        let expectation = self.expectation(description: "testUpdateState")
        
        Networking.updateState(email: email, locationID: locationID, consumerID: consumerID, modus: "START", pvID: pvID) { (state) in
            
            XCTAssertNotNil(state)
            
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
        
        let location = Location(id: locationID, city: "Perg", country: "Austria", name: "Location 1", zip: "123")
        
        Networking.updateLocation(email: email, location: location) { (didSucceed) in
            
            XCTAssertTrue(didSucceed)
            
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
        
        let generator = Generator(id: pvID, type: "Type")
        
        Networking.updateGenerator(email: email, locationID: locationID, generator: generator) { (didSucceed) in
            
            XCTAssertTrue(didSucceed)
            
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
        
        let consumer = Consumer(id: consumerID, averageConsumption: 0.0, company: "", name: "", serial: consumerSerial, state: .running, type: consumerType)
        
        Networking.updateConsumer(email: email, locationID: locationID, pvID: pvID, consumer: consumer) { (didSucceed) in
            
            XCTAssertTrue(didSucceed)
            
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
        
        let location = Location(id: "", city: "Linz", country: "Austria", name: "Name of Location", zip: "2123")
        
        Networking.addLocation(email: email, location: location) { (locationID) in
            
            // Get generated locationID
            guard let locationID = locationID else {
                XCTFail()
                return
            }
            
            Networking.deleteLocation(email: self.email, locationID: locationID) { (didSucceed) in
                
                XCTAssertTrue(didSucceed)
                
                expectation.fulfill()
                
            }
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteGenerator() throws {
        
        let expectation = self.expectation(description: "testDeleteGenerator")
        
        Networking.addPV(email: email, locationID: locationID, pvID: "delete-me") { (didSucceed) in
            
            Networking.deleteGenerator(email: self.email, locationID: self.locationID, pvID: "delete-me") { (didSucceed) in
                
                XCTAssertTrue(didSucceed)
                
                expectation.fulfill()
                
            }
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteConsumer() throws {
        
        let expectation = self.expectation(description: "testDeleteConsumer")
        
        let consumer = Consumer(id: consumerID, averageConsumption: 0.0, company: "Company", name: "Name", serial: consumerSerial, state: .running, type: consumerType)
        
        Networking.addConsumer(email: email, locationID: locationID, consumer: consumer) { (state, consumerID) in
            
            guard let consumerID = consumerID else {
                XCTFail()
                return
            }
            
            Networking.deleteConsumer(email: self.email, locationID: self.locationID, consumerID: consumerID) { (didSucceed) in
                
                XCTAssertTrue(didSucceed)
                
                expectation.fulfill()
                
            }
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: Account Tests
    
    func testUpdateUserPassword() throws {
        
        let expectation = self.expectation(description: "testUpdateUserPassword")
        
        Networking.updateUserPassword(email: email, password: "IWillBeGoneSoon") { (didSucceed) in
            
            Networking.updateUserPassword(email: self.email, password: self.password) { (didSucceedSecondChange) in
                
                XCTAssertTrue(didSucceedSecondChange)
                
                expectation.fulfill()
                
            }
            
        }
        
        waitForExpectations(timeout: TimeInterval(maximumWaitForExpectation)) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: Internal Functionality
    
    func testUnescapeString() {
        XCTAssertEqual(Networking.unescape(data: "hello") as? String, "hello")
        XCTAssertEqual(Networking.unescape(data: "\"") as? String, "")
        XCTAssertEqual(Networking.unescape(data: "Hello\"This is fun") as? String, "HelloThis is fun")
    }
    
    func testUnescapeDictionary(){
        
        let dictionary: [String : Any] = [
            "variable1": "\"hello",
            "entry2": "\"hel\"lo",
            "test3": "\"hello",
            "dic": [
                "welcome": "\"to \"level deux",
                "array": [10, 299, "string", "string2", "h\"mm"]
            ],
        ]
        
        let unescaped = Networking.unescape(data: dictionary) as! [String : Any]
        
        XCTAssertEqual(unescaped["variable1"] as! String, "hello")
        
        let second_level_dictionary = unescaped["dic"] as! [String : Any]
        
        XCTAssertEqual(second_level_dictionary["welcome"] as! String, "to level deux")
        
        let third_level_array = second_level_dictionary["array"] as! NSArray
        
        XCTAssertEqual(third_level_array[2] as! String, "string")
        XCTAssertEqual(third_level_array[4] as! String, "hmm")
    }
}
