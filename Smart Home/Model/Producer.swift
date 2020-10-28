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
    
    init(name: String, company: String, production: Int, state: Device.State) {
        super.init(name: name, company: company, state: state)
        self.production = production
    }
}
