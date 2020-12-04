//
//  Greeting.swift
//  Smart Home
//
//  Created by Goga Barabadze on 17.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Greeting {
    
    static func message() -> String {
        
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 0...11:
            return "Good Morning"
        case 12...16:
            return "Good Afternoon"
        case 17...24:
            return "Good Evening"
        default:
            return "Hey"
        }
    }
}
