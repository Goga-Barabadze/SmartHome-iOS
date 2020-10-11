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
    var weather = Weather()
    
    init(zip: String, place: String, weather: Weather) {
        self.zip = zip
        self.place = place
        self.weather = weather
    }
    
    init() {
        
    }
}
