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
    var name: String = ""
    var state: State = .not_running
    
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
        
        static func from(state: State) -> String {
            
            switch state {
            case .running:
                return "RUNNING"
            case .not_running:
                return "NOT_RUNNING"
            case .should_be_running:
                return "SHOULD_BE_RUNNING"
            case .should_not_be_running:
                return "SHOULD_NOT_BE_RUNNING"
            }
        }
        
    }
    
    init (id: String){
        self.id = id
    }
    
    init (id: String, name: String){
        self.id = id
        self.name = name
    }
    
    init() {
        
    }
}
