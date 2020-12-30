//
//  ConsumerData.swift
//  Smart Home
//
//  Created by Goga Barabadze on 30.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class ConsumerData {
    
    var type = ""
    var state = Device.State.not_running
    var consumption = 0.0
    
    init(type: String, state: Device.State, consumption: Double) {
        self.type = type
        self.state = state
        self.consumption = consumption
    }
}
