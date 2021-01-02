//
//  Location.swift
//  Smart Home
//
//  Created by Goga Barabadze on 25.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Location {
    
    var id: String = ""
    var city: String = ""
    var country: String = ""
    var name: String = ""
    var zip: String = ""
    var devices: [Device] = []
    var weather: Weather = Weather()
    
    var currentProduction: Double {
    
        var production = 0.0

        for producer in devices.filter({type(of: $0) == Generator.self}) {

            let currentProducer = producer as! Generator

            if (currentProducer.state == .not_running || currentProducer.state == .should_be_running){
                continue
            }

            production += currentProducer.production
        }

        return production
    }

    var currentConsumption: Double {

        var consumption = 0.0

        for consumer in devices.filter({type(of: $0) == Consumer.self}) {

            let currentConsumer = consumer as! Consumer

            if (currentConsumer.state == .not_running || currentConsumer.state == .should_be_running){
                continue
            }

            consumption += currentConsumer.consumption
        }

        return consumption
    }
    
    init(id: String, city: String, country: String, name: String, zip: String) {
        self.id = id
        self.city = city
        self.country = country
        self.name = name
        self.zip = zip
    }
    
    init(id: String, city: String, country: String, name: String, zip: String, devices: [Device]) {
        self.id = id
        self.city = city
        self.country = country
        self.name = name
        self.zip = zip
        self.devices = devices
    }
    
    init() {
        
    }
}
