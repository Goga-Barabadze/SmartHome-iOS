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
            
            var finalLocations = [Location]()
            
            let dictionary = result as? [String : Any]
            
            guard let unparsedLocations = dictionary?["Locations"] as? NSArray else {
                return
            }
            
            for currentlyIteratedLocation in unparsedLocations {
                
                let dictionaryOfCurrentLocation = (currentlyIteratedLocation as? [String : Any])?["Location"] as! [String : Any]
                
                guard
                    let locationID = dictionaryOfCurrentLocation["locationID"] as? String,
                    let country = dictionaryOfCurrentLocation["country"] as? String,
                    let name = dictionaryOfCurrentLocation["name"] as? String,
                    let zip = dictionaryOfCurrentLocation["zip"] as? String,
                    let city = dictionaryOfCurrentLocation["city"] as? String
                else {
                    os_log("Skipping over this location because found nil while unwrapping optional.")
                    continue
                }
                
                finalLocations.append(Location(id: locationID, city: city, country: country, name: name, zip: zip))
            }
            
            closure(finalLocations)
            
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
                    return
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
                    return
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
                    return
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
                    return
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
                    return
                }
                
                finalConsumer.append(Generator(id: id, type: type))
            }
            
            closure(finalConsumer)
            
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
