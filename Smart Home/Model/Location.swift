//
//  Location.swift
//  Smart Home
//
//  Created by Goga Barabadze on 25.12.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Location {
    
    var id: String = ""
    var city: String = ""
    var country: String = ""
    var name: String = ""
    var zip: String = ""
    var devices: [Device] = []
    
    init(id: String, city: String, country: String, name: String, zip: String) {
        self.id = id
        self.city = city
        self.country = country
        self.name = name
        self.zip = zip
    }
}
