//
//  Location.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Location {
    
    var zip = ""
    var place = ""
    var province = ""
    var weather = Weather(temperatureInCelsius: 0, windSpeedInKilometerPerHour: 0, sunrise: "", sunset: "", visibilityInKilometers: 0)
    
    init(zip: String, place: String, province: String, weather: Weather) {
        self.zip = zip
        self.place = place
        self.province = province
        self.weather = weather
    }
    
    init() {
        
    }
}
