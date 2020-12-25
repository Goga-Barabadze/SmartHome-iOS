//
//  SmartHomeTests.swift
//  SmartHomeTests
//
//  Created by Goga Barabadze on 12.10.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import XCTest
@testable import Smart_Home

class ModelTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testCurrentConsumptionEmpty() throws {
        let weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
        let location = OldLocation(zip: "ZIP", place: "PLACE", province: "PROVINCE", weather: weather)
        let device = OldDevice(name: "DEVICE NAME", company: "COMPANY", state: .running)
        let station = OldStation(name: "STATION NAME", location: location, devices: [device])

        XCTAssert(station.currentConsumption == 0)
    }
    
    func testCurrentProductionEmpty() {
        let weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
        let location = OldLocation(zip: "ZIP", place: "PLACE", province: "PROVINCE", weather: weather)
        let device = OldDevice(name: "DEVICE NAME", company: "COMPANY", state: .running)
        let station = OldStation(name: "STATION NAME", location: location, devices: [device])

        XCTAssert(station.currentProduction == 0)
    }
    
    func testCurrentConsumptionWithMultipleRunningConsumers() throws {
        let weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
        let location = OldLocation(zip: "ZIP", place: "PLACE", province: "PROVINCE", weather: weather)
        let consumer_1 = OldConsumer(name: "CONSUMER", consumption: 7, manufacturer: "MANUFACTURER", state: .running)
        let consumer_2 = OldConsumer(name: "CONSUMER", consumption: 8, manufacturer: "MANUFACTURER", state: .running)
        let consumer_3 = OldConsumer(name: "CONSUMER", consumption: 9, manufacturer: "MANUFACTURER", state: .running)
        let station = OldStation(name: "STATION NAME", location: location, devices: [consumer_1, consumer_2, consumer_3])

        XCTAssert(station.currentConsumption == 24)
    }
    
    func testCurrentProductionWithMultipleRunningProducers() throws {
        let weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
        let location = OldLocation(zip: "ZIP", place: "PLACE", province: "PROVINCE", weather: weather)
        let producer_1 = OldProducer(name: "PRODUCER", production: 7, manufacturer: "MANUFACTURER", state: .running)
        let producer_2 = OldProducer(name: "PRODUCER", production: 8, manufacturer: "MANUFACTURER", state: .running)
        let producer_3 = OldProducer(name: "PRODUCER", production: 9, manufacturer: "MANUFACTURER", state: .running)
        let station = OldStation(name: "STATION NAME", location: location, devices: [producer_1, producer_2, producer_3])

        XCTAssert(station.currentProduction == 24)
    }
    
    func testCurrentConsumptionWithMultipleMixedRunningAndNotRunningConsumers() throws {
        let weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
        let location = OldLocation(zip: "ZIP", place: "PLACE", province: "PROVINCE", weather: weather)
        let consumer_1 = OldConsumer(name: "CONSUMER", consumption: 1, manufacturer: "MANUFACTURER", state: .running)
        let consumer_2 = OldConsumer(name: "CONSUMER", consumption: 1, manufacturer: "MANUFACTURER", state: .not_running)
        let consumer_3 = OldConsumer(name: "CONSUMER", consumption: 1, manufacturer: "MANUFACTURER", state: .should_be_running)
        let consumer_4 = OldConsumer(name: "CONSUMER", consumption: 1, manufacturer: "MANUFACTURER", state: .should_not_be_running)
        let station = OldStation(name: "STATION NAME", location: location, devices: [consumer_1, consumer_2, consumer_3, consumer_4])

        XCTAssert(station.currentConsumption == 2)
    }
    
    func testCurrentProductionWithMultipleMixedRunningAndNotRunningProducers() throws {
        let weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
        let location = OldLocation(zip: "ZIP", place: "PLACE", province: "PROVINCE", weather: weather)
        let producer_1 = OldProducer(name: "PRODUCER", production: 1, manufacturer: "MANUFACTURER", state: .running)
        let producer_2 = OldProducer(name: "PRODUCER", production: 1, manufacturer: "MANUFACTURER", state: .not_running)
        let producer_3 = OldProducer(name: "PRODUCER", production: 1, manufacturer: "MANUFACTURER", state: .should_be_running)
        let producer_4 = OldProducer(name: "PRODUCER", production: 1, manufacturer: "MANUFACTURER", state: .should_not_be_running)
        let station = OldStation(name: "STATION NAME", location: location, devices: [producer_1, producer_2, producer_3, producer_4])

        XCTAssert(station.currentProduction == 2)
    }

    func testPerformanceOfConsumptionProductionCalculation() throws {
        
        let weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
        let location = OldLocation(zip: "ZIP", place: "PLACE", province: "PROVINCE", weather: weather)
        var devices = [OldDevice]()
        
        for i in 0...99999 {
            devices.append(OldProducer(name: "PRODUCER", production: i * 1, manufacturer: "MANUFACTURER", state: .running))
            devices.append(OldProducer(name: "PRODUCER", production: i * 11, manufacturer: "MANUFACTURER", state: .not_running))
            devices.append(OldProducer(name: "PRODUCER", production: i * 111, manufacturer: "MANUFACTURER", state: .should_be_running))
            devices.append(OldProducer(name: "PRODUCER", production: i * 1111, manufacturer: "MANUFACTURER", state: .should_not_be_running))
            
            devices.append(OldConsumer(name: "CONSUMER", consumption: i * 1, manufacturer: "MANUFACTURER", state: .running))
            devices.append(OldConsumer(name: "CONSUMER", consumption: i * 11, manufacturer: "MANUFACTURER", state: .not_running))
            devices.append(OldConsumer(name: "CONSUMER", consumption: i * 111, manufacturer: "MANUFACTURER", state: .should_be_running))
            devices.append(OldConsumer(name: "CONSUMER", consumption: i * 1111, manufacturer: "MANUFACTURER", state: .should_not_be_running))
        }
        
        let station = OldStation(name: "STATION NAME", location: location, devices: devices)
        
        measure {
            XCTAssert(station.currentConsumption == 5559944400000)
            XCTAssert(station.currentProduction == 5559944400000)
        }
    }

}
