//
//  Networking.swift
//  Smart Home
//
//  Created by Goga Barabadze on 28.10.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation
import FirebaseFunctions
import FirebaseAuth
import os

class Networking {
    
    enum Function : String {
        case getFroniusLocation = "getFroniusLocation"
        case getLocations = "getLocations"
        case getPVData = "getPVData"
        case getWeather = "getWeather"
        case getForecast = "getForecast"
        case getPossibleCompanies = "getPossibleCompanies"
        case getPossibleConsumers = "getPossibleConsumers"
        case getGenerators = "getGenerators"
        case getConsumers = "getConsumers"
        case getConsumerData = "getConsumerData"
        case addPV = "addPV"
        case addConsumer = "addConsumer"
        case addLocation = "addLocation"
        case updateState = "updateState"
        case updateLocation = "updateLocation"
        case updateGenerator = "updateGenerator"
        case updateConsumer = "updateConsumer"
        case deleteLocation = "deleteLocation"
        case deleteGenerator = "deleteGenerator"
        case deleteConsumer = "deleteConsumer"
        case updateUserPassword = "updateUserPassword"
    }
    
    static func call(function: Function, with parameters: [String : Any]?, closure: @escaping (Any?, NSError?) -> ()){
        
        Functions.functions().httpsCallable(function.rawValue).call(parameters) { (result, error) in
            
            if let error = error as NSError? {
                
                if error.domain == FunctionsErrorDomain {
                    
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    
                    print("code: \(String(describing: code)), message: \(message), details: \(String(describing: details))")
                }
                
                closure(nil, error)
                return
            }
            
            closure(result?.data, nil)
        }
    }
    
    static func getLocations(email: String, closure: @escaping ([Location]?) -> ()){
        
        let parameters: [String : Any] = [
            "email": email
        ]
        
        call(function: .getLocations, with: parameters) { (result, error) in
            
            var locations = [Location]()
            
            guard
                let dictionary = result as? [String : Any],
                let resultLocations = dictionary["Locations"] as? NSArray
            else {
                return
            }
            
            for resultLocation in resultLocations {
                
                guard
                    let locationDictionary = (resultLocation as? [String : Any])?["Location"] as? [String : Any],
                    let id = locationDictionary["locationID"] as? String,
                    let country = locationDictionary["country"] as? String,
                    let name = locationDictionary["name"] as? String,
                    let zip = locationDictionary["zip"] as? String,
                    let city = locationDictionary["city"] as? String
                else {
                    os_log("Skipping over this location because found nil while unwrapping optional.")
                    continue
                }
                
                locations.append(Location(id: id, city: city, country: country, name: name, zip: zip))
            }
            
            closure(locations)
            
        }
        
    }
    
    static func getFroniusLocation(pvID: String, closure: @escaping (Location?) -> ()){
        
        let parameters: [String : Any] = [
            "pvID": pvID
        ]
        
        call(function: .getFroniusLocation, with: parameters) { (result, error) in
            
            guard
                let dictionary = result as? [String : Any],
                let locationID = dictionary["locationID"] as? Int,
                let country = dictionary["country"] as? String,
                let name = dictionary["name"] as? String,
                let zip = dictionary["zip"] as? String,
                let city = dictionary["city"] as? String
            else {
                os_log("Could not unwrap fronius location.")
                closure(nil)
                return
            }
            
            closure(Location(id: String(locationID), city: city, country: country, name: name, zip: zip))
            
        }
        
    }
    
    static func getWeather(city: String, closure: @escaping (Weather?) -> ()){
        
        let parameters: [String : Any] = [
            "city": city
        ]
        
        call(function: .getWeather, with: parameters) { (result, error) in
            
            guard
                let dictionary = result as? [String : Any],
                let description = dictionary["description"] as? String,
                let temperature = dictionary["temp"] as? Double,
                let sunset = dictionary["sunset"] as? Double,
                let sunrise = dictionary["sunrise"] as? Double,
                let datetime = dictionary["dt"] as? Double
            else {
                os_log("Could not unwrap weather object.")
                closure(nil)
                return
            }
            
            closure(Weather(description: description, temperature: temperature, sunset: sunset, sunrise: sunrise, datetime: datetime))
            
        }
        
    }
    
    static func getForecast(city: String, closure: @escaping ([Weather]?) -> ()){
        
        let parameters: [String : Any] = [
            "city": city
        ]
        
        call(function: .getForecast, with: parameters) { (result, error) in
            
            var finalForecast = [Weather]()
            
            guard
                let dictionary = result as? [String : Any],
                let unparsedForecast = dictionary.first?.value as? NSArray
            else {
                return
            }
            
            for currentlyIteratedWeather in unparsedForecast {
                
                guard
                    let dictionaryOfCurrentWeather = currentlyIteratedWeather as? [String : Any],
                    let description = dictionaryOfCurrentWeather["description"] as? String,
                    let temperature = dictionaryOfCurrentWeather["temp"] as? Double,
                    let datetime = dictionaryOfCurrentWeather["dt"] as? String
                else {
                    os_log("Could not unwrap weather object from forecast.")
                    closure([])
                    continue
                }

                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                guard let date = dateFormatter.date(from: datetime.replacingOccurrences(of: "\"", with: "")) else {
                    return
                }
                
                finalForecast.append(Weather(description: description, temperature: temperature, datetime: date))
            }
            
            closure(finalForecast)
        }
        
    }
    
    static func getGeneratorData(pvID: String, closure: @escaping ([GeneratorData]?) -> ()){
        
        let parameters: [String : Any] = [
            "pvID": pvID
        ]
        
        call(function: .getPVData, with: parameters) { (result, error) in
            
            var finalGeneratorData = [GeneratorData]()
            
            guard
                let dictionary = result as? [String : Any],
                let unparsedData = dictionary.first?.value as? NSArray
            else {
                return
            }
            
            for currentlyIteratedData in unparsedData {
                
                guard
                    let dictionaryOfCurrentData = currentlyIteratedData as? [String : Any],
                    let channelName = dictionaryOfCurrentData["channelName"] as? String,
                    let channelType = dictionaryOfCurrentData["channelType"] as? String,
                    let unit = dictionaryOfCurrentData["unit"] as? String
                else {
                    os_log("Could not unwrap pvData.")
                    closure([])
                    continue
                }
                
                let value = (dictionaryOfCurrentData["value"] as? Double) ?? 0.0

                finalGeneratorData.append(GeneratorData(value: value, channelName: channelName, channelType: channelType, unit: unit))
            }
            
            closure(finalGeneratorData)
            
        }
        
    }
    
    static func getPossibleCompanies(closure: @escaping ([Company]?) -> ()){
        
        call(function: .getPossibleCompanies, with: nil) { (result, error) in
            
            var finalCompanies = [Company]()
            
            guard
                let dictionary = result as? [String : Any],
                let unparsedCompanies = dictionary.first?.value as? NSArray
            else {
                return
            }
            
            for currentlyIteratedCompany in unparsedCompanies {
                
                guard
                    let dictionaryOfCurrentCompany = currentlyIteratedCompany as? [String : Any],
                    let valueOfdictionaryOfCurrentCompany = dictionaryOfCurrentCompany.values.first as? [String : Any],
                    let id = valueOfdictionaryOfCurrentCompany["companyID"] as? String,
                    let name = valueOfdictionaryOfCurrentCompany["companyName"] as? String
                else {
                    os_log("Could not unwrap company.")
                    closure([])
                    continue
                }

                finalCompanies.append(Company(id: id, name: name))
            }
            
            closure(finalCompanies)
            
        }
        
    }
    
    static func getPossibleConsumers(companyID: String, closure: @escaping ([Consumer]?) -> ()){
        
        let parameters: [String : Any] = [
            "companyID": companyID
        ]
        
        call(function: .getPossibleConsumers, with: parameters) { (result, error) in
            
            var finalConsumer = [Consumer]()
            
            guard
                let dictionary = result as? [String : Any],
                let unparsedConsumers = dictionary.first?.value as? NSArray
            else {
                return
            }
            
            for currentlyIteratedConsumer in unparsedConsumers {
                
                guard
                    let dictionaryOfCurrentConsumer = currentlyIteratedConsumer as? [String : Any],
                    let valueOfdictionaryOfCurrentCompany = dictionaryOfCurrentConsumer.values.first as? [String : Any],
                    let id = valueOfdictionaryOfCurrentCompany["consumerID"] as? String,
                    let averageConsumption = valueOfdictionaryOfCurrentCompany["averageConsumption"] as? Double,
                    let consumerType = valueOfdictionaryOfCurrentCompany["consumerType"] as? String
                else {
                    os_log("Could not unwrap consumer.")
                    closure([])
                    continue
                }
                
                finalConsumer.append(Consumer(id: id, averageConsumption: averageConsumption, type: consumerType))
            }
            
            closure(finalConsumer)
            
        }
        
    }
    
    static func getGenerators(email: String, locationID: String, closure: @escaping ([Generator]?) -> ()){
        
        let parameters: [String : Any] = [
            "email" : email,
            "locationID" : locationID
        ]
        
        call(function: .getGenerators, with: parameters) { (result, error) in
            
            var finalConsumer = [Generator]()
            
            guard
                let dictionary = result as? [String : Any],
                let unparsedGenerators = dictionary.first?.value as? NSArray
            else {
                return
            }
            
            for currentlyIteratedGenerators in unparsedGenerators {
                
                guard
                    let dictionaryOfCurrentGenerator = currentlyIteratedGenerators as? [String : Any],
                    let valueOfdictionaryOfCurrentGenerator = dictionaryOfCurrentGenerator.values.first as? [String : Any],
                    let id = valueOfdictionaryOfCurrentGenerator["pvID"] as? String,
                    let type = valueOfdictionaryOfCurrentGenerator["generatorType"] as? String
                else {
                    os_log("Could not unwrap generator.")
                    closure([])
                    continue
                }
                
                finalConsumer.append(Generator(id: id, type: type))
            }
            
            closure(finalConsumer)
            
        }
        
    }
    
    static func getConsumers(email: String, locationID: String, closure: @escaping ([Consumer]?) -> ()){
        
        let parameters: [String : Any] = [
            "email" : email,
            "locationID" : locationID
        ]
        
        call(function: .getConsumers, with: parameters) { (result, error) in
            
            var consumers = [Consumer]()
            
            guard
                let dictionary = result as? [String : Any],
                let resultConsumers = dictionary["Consumers"] as? NSArray
            else {
                return
            }
            
            for resultConsumer in resultConsumers {
                
                guard
                    let consumerDictionary = (resultConsumer as? [String : Any])?["Consumer"] as? [String : Any],
                    let id = consumerDictionary["consumerID"] as? String,
                    let state = (consumerDictionary["consumerState"] as? String)?.replacingOccurrences(of: "\"", with: ""),
                    let serial = consumerDictionary["consumerSerial"] as? String,
                    let averageConsumptionAsString = consumerDictionary["consumerAverageConsumption"] as? String,
                    let averageConsumption = Double(averageConsumptionAsString.replacingOccurrences(of: "\"", with: "")),
                    let type = consumerDictionary["consumerType"] as? String,
                    let consumerName = consumerDictionary["consumerName"] as? String,
                    let companyName = consumerDictionary["companyName"] as? String
                else {
                    os_log("Skipping over this consumer because found nil while unwrapping optional.")
                    closure([])
                    continue
                }
                
                consumers.append(Consumer(id: id, averageConsumption: averageConsumption, company: companyName, name: consumerName, serial: serial, state: Device.State.from(text: state), type: type))
            }
            
            closure(consumers)
            
        }
        
    }
    
    static func getConsumerData(consumerType: String, closure: @escaping ([ConsumerData]?) -> ()){
        
        let parameters: [String : Any] = [
            "consumerType": consumerType
        ]
        
        call(function: .getConsumerData, with: parameters) { (result, error) in
            
            var finalGeneratorData = [ConsumerData]()
            
            guard
                let dictionary = result as? [String : Any],
                let unparsedData = dictionary.first?.value as? NSArray
            else {
                return
            }
            
            for currentlyIteratedData in unparsedData {
                
                guard
                    let dictionaryOfCurrentData = currentlyIteratedData as? [String : Any],
                    let type = dictionaryOfCurrentData["type"] as? String,
                    let state = dictionaryOfCurrentData["state"] as? String,
                    let consumption = Double(dictionaryOfCurrentData["consumption"] as? String ?? "0.00")
                else {
                    os_log("Could not unwrap ConsumerData.")
                    closure([])
                    continue
                }
                
                finalGeneratorData.append(ConsumerData(type: type, state: Device.State.from(text: state), consumption: consumption))
            }
            
            closure(finalGeneratorData)
            
        }
        
    }
    
    static func addPV(email: String, locationID: String, pvID: String, closure: @escaping (Bool) -> ()){
        
        let parameters: [String : Any] = [
            "email": email,
            "locationID": locationID,
            "pvID": pvID
        ]
        
        call(function: .addPV, with: parameters) { (result, error) in
            
            guard
                let dictionary = result as? [String : Any],
                let message = dictionary["message"] as? String
            else {
                return
            }
            
            closure(message == "Successful")
            
        }
        
    }
    
    static func addConsumer(email: String, locationID: String, consumer: Consumer, closure: @escaping (String?, String?) -> ()){
        
        let parameters: [String : Any] = [
            "email": email,
            "locationID": locationID,
            "companyName": consumer.company,
            "consumerName": consumer.name,
            "consumerType": consumer.type,
            "consumerSerial": consumer.serial,
            "averageConsumption": consumer.averageConsumption,
            "state": Device.State.from(state: consumer.state)
        ]
        
        call(function: .addConsumer, with: parameters) { (result, error) in
            
            guard
                let dictionary = result as? [String : Any],
                let state = dictionary["state"] as? String,
                let consumerID = dictionary["consumerID"] as? String
            else {
                closure(nil, nil)
                return
            }
            
            closure(state, consumerID)
            
        }
        
    }
    
    static func addLocation(email: String, location: Location, closure: @escaping (String?) -> ()){
        
        let parameters: [String : Any] = [
            "email": email,
            "name": "Test Location",
            "zip": "4320",
            "city": "Perg",
            "country": "Austria"
        ]
        
        call(function: .addLocation, with: parameters) { (result, error) in
            
            guard
                let dictionary = result as? [String : Any],
                let locationID = dictionary["locationID"] as? String
            else {
                closure(nil)
                return
            }
            
            closure(locationID)
            
        }
        
    }
    
    static func isLoggedIn() -> Bool {
        return FirebaseAuth.Auth.auth().currentUser != nil
    }
    
    static func signOut() {
        do{
            try FirebaseAuth.Auth.auth().signOut()
        } catch let error as NSError {
            print(error)
            os_log("Could not properly log out user.")
        }
    }
}
