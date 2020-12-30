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
        
        static func from(text: String) -> State {
            
            let upper = text.uppercased()
            
            switch upper {
            case "RUNNING":
                return State.running
            case "NOT_RUNNING":
                return State.not_running
            case "SHOULD_BE_RUNNING":
                return State.should_be_running
            case "SHOULD_NOT_BE_RUNNING":
                return State.should_not_be_running
            default:
                return State.not_running
            }
            
        }
        
    }
    
    init (id: String){
        self.id = id
    }
}
