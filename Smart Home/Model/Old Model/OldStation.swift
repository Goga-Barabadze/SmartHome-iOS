//
//  Station.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class OldStation {
    
    var name = ""
    var location = OldLocation()
    var devices: [OldDevice] = [OldDevice]()
    
    var currentProduction: Int {
        
        var production = 0
        
        for producer in devices.filter({type(of: $0) == OldProducer.self}) {
            
            let currentProducer = producer as! OldProducer
            
            if (currentProducer.state == .not_running || currentProducer.state == .should_be_running){
                continue
            }
            
            production += currentProducer.production
        }
        
        return production
    }
    
    var currentConsumption: Int {
        
        var consumption = 0
        
        for consumer in devices.filter({type(of: $0) == OldConsumer.self}) {
            
            let currentConsumer = consumer as! OldConsumer
            
            if (currentConsumer.state == .not_running || currentConsumer.state == .should_be_running){
                continue
            }
            
            consumption += currentConsumer.consumption
        }
        
        return consumption
    }
    
    init(name: String, location: OldLocation, devices: [OldDevice]) {
        self.name = name
        self.location = location
        self.devices = devices
    }
    
    init(name: String, location: OldLocation) {
        self.name = name
        self.location = location
    }
    
    init() {
        
    }
}
