//
//  GeneratorData.swift
//  Smart Home
//
//  Created by Goga Barabadze on 30.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class GeneratorData {
    
    var value = 0.0
    var channelName = ""
    var channelType = ""
    var unit = ""
    
    init(value: Double, channelName: String, channelType: String, unit: String) {
        self.value = value
        self.channelName = channelName
        self.channelType = channelType
        self.unit = unit
    }
    
}
