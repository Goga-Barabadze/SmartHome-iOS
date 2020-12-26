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
