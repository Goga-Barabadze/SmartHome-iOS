//
//  Station.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Station {
    
    var name = ""
    var location = Location()
    var devices = [Device]()
    
    init(name: String, location: Location, devices: [Device]) {
        self.name = name
        self.location = location
        self.devices = devices
    }
    
    init() {
        
    }
}
