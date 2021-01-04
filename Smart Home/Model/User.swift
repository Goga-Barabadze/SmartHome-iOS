//
//  User.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class User {
    
    // Singleton
    static var main = User()
    
    var email = ""
    var locations = [Location]()
    
    init(email: String, locations: [Location]) {
        self.email = email
        self.locations = locations
    }
    
    init() {
        
    }
}
