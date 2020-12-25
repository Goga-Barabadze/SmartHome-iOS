//
//  Device.swift
//  Smart Home
//
//  Created by Goga Barabadze on 25.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Device {
    
    var id: String = ""
    
    enum State : String {
        case running
        case not_running
        case should_be_running
        case should_not_be_running
    }
    
}
