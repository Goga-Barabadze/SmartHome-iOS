//
//  Device.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Device {
    
    var name = ""
    var state = State.running
    
    init(name: String, state: State) {
        self.name = name
    }
    
    enum State : String {
        case running
        case not_running
        case should_be_running
        case should_not_be_running
    }
}
