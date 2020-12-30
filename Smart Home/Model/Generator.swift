//
//  Generator.swift
//  Smart Home
//
//  Created by Goga Barabadze on 25.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Generator: Device {
    
    var type: String = ""
    
    init(id: String, type: String) {
        super.init(id: id)
        self.type = type
    }
}
