//
//  Weather.swift
//  Smart Home
//
//  Created by Goga Barabadze on 26.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Weather {
    
    var description: String = ""
    var temperature: Double = 0.0
    var sunset: Date = Date()
    var sunrise: Date = Date()
    var datetime: Date = Date()
    
    var time: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: datetime)
        
        return "\(hour):00"
    }
    
    var formattedSunset: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: sunset)
        let minute = calendar.component(.minute, from: sunset)
        return "\(hour):\(minute)"
    }
    
    var formattedSunrise: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: sunrise)
        let minute = calendar.component(.minute, from: sunrise)
        return "\(hour):\(minute)"
    }
    
    init(description: String, temperature: Double, sunset: Double, sunrise: Double, datetime: Double) {
        self.description = description
        self.temperature = temperature
        self.sunset = Date.init(timeIntervalSince1970: sunset)
        self.sunrise = Date.init(timeIntervalSince1970: sunrise)
        self.datetime = Date.init(timeIntervalSince1970: datetime)
    }
    
    init(description: String, temperature: Double, datetime: Double) {
        self.description = description
        self.temperature = temperature
        self.datetime = Date.init(timeIntervalSince1970: datetime)
    }
    
    init(description: String, temperature: Double, datetime: Date) {
        self.description = description
        self.temperature = temperature
        self.datetime = datetime
    }
    
    init(description: String, temperature: Double, sunset: Date, sunrise: Date, datetime: Date) {
        self.description = description
        self.temperature = temperature
        self.sunset = sunset
        self.sunrise = sunrise
        self.datetime = datetime
    }
    
    init() {
        
    }
}
