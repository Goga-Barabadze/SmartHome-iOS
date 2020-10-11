//
//  Consumer.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Consumer : Device {
    
    var consumption = 0
    
    init(name: String, consumption: Int, state: Device.State) {
        super.init(name: name, state: state)
        self.consumption = consumption
    }
}
