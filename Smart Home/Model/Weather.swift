//
//  Weather.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Weather {
    
    var temperatureInCelsius = 0
    var windSpeedInKilometerPerHour = 0
    var sunrise = ""
    var sunset = ""
    var visibilityInKilometers = 0
 
    init(temperatureInCelsius: Int, windSpeedInKilometerPerHour: Int, sunrise: String, sunset: String, visibilityInKilometers: Int) {
        self.temperatureInCelsius = temperatureInCelsius
        self.windSpeedInKilometerPerHour = windSpeedInKilometerPerHour
        self.sunrise = sunrise
        self.sunset = sunset
        self.visibilityInKilometers = visibilityInKilometers
    }
    
}
