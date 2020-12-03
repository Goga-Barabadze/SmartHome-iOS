//
//  Producer.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Producer : Device {
    
    var production = 0
    
    init(name: String, production: Int, manufacturer: String, state: Device.State) {
        super.init(name: name, company: manufacturer, state: state)
        self.production = production
    }
}
