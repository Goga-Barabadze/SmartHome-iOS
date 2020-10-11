//
//  User.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class User {
    
    var name = ""
    var email = ""
    var stations = [Station]()
    
    init(name: String, email: String, stations: [Station]) {
        self.name = name
        self.email = email
        self.stations = stations
    }
    
    init() {
        
    }
}
