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
    var devices: [Device] = [Device]()
    
    var currentProduction: Int {
        
        var production = 0
        
        for producer in devices.filter({type(of: $0) == Producer.self}) {
            production += (producer as! Producer).production
        }
        
        return production
    }
    
    var currentConsumption: Int {
        
        var consumption = 0
        
        for consumer in devices.filter({type(of: $0) == Consumer.self}) {
            consumption += (consumer as! Consumer).consumption
        }
        
        return consumption
    }
    
    init(name: String, location: Location, devices: [Device]) {
        self.name = name
        self.location = location
        self.devices = devices
    }
    
    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
    
    init() {
        
    }
}
