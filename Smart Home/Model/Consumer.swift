//
//  Consumer.swift
//  Smart Home
//
//  Created by Goga Barabadze on 25.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Consumer: Device {
    
    var averageConsumption: Double = 0.0
    var company: String = ""
    var name: String = ""
    var serial: String = ""
    var state: Device.State = .not_running
    var type: String = ""
    
    init(id: String, averageConsumption: Double, type: String) {
        
        super.init(id: id)
        self.averageConsumption = averageConsumption
        self.type = type
        
    }
}
