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
            
            let currentProducer = producer as! Producer
            
            if (currentProducer.state == .not_running || currentProducer.state == .should_be_running){
                continue
            }
            
            production += currentProducer.production
        }
        
        return production
    }
    
    var currentConsumption: Int {
        
        var consumption = 0
        
        for consumer in devices.filter({type(of: $0) == Consumer.self}) {
            
            let currentConsumer = consumer as! Consumer
            
            if (currentConsumer.state == .not_running || currentConsumer.state == .should_be_running){
                continue
            }
            
            consumption += currentConsumer.consumption
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
