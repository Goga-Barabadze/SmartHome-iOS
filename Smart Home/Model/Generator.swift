//
//  Generator.swift
//  Smart Home
//
//  Created by Goga Barabadze on 25.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Generator: Device {
    
    var type: String = "Fronius"
    
    var production: Double {
        
        return (generatorData.first(where: { (gd) -> Bool in
            gd.channelName == "PowerPV"
        })?.value ?? 0) as Double
        
    }
    
    var generatorData = [GeneratorData]()
    
    init(id: String, type: String) {
        super.init(id: id)
        super.name = id
        self.type = type
    }
}
