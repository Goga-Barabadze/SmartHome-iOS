//
//  Consumer.swift
//  Smart Home
//
//  Created by Goga Barabadze on 25.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Consumer: Device {
    
    var consumption: Double = 0.0
    var company: String = ""
    var serial: String = ""
    var type: String = ""
    
    init(id: String, averageConsumption: Double, type: String) {
        super.init(id: id)
        self.consumption = averageConsumption
        self.type = type
    }
    
    init(id: String, averageConsumption: Double, company: String, name: String, serial: String, state: Device.State, type: String) {
        super.init(id: id)
        self.consumption = averageConsumption
        self.company = company
        self.name = name
        self.serial = serial
        self.state = state
        self.type = type
    }
}
