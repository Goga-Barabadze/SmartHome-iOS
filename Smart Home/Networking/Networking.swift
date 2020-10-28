//
//  Networking.swift
//  Smart Home
//
//  Created by Goga Barabadze on 28.10.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation
import FirebaseFunctions

class Networking {
    
    static func call(function: String, with arguments: [String : Any]?){
        
        Functions.functions().httpsCallable(function).call(arguments) { (result, error) in
            
            if let error = error as NSError? {
                
                if error.domain == FunctionsErrorDomain {
                    
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    
                    print("code: \(String(describing: code)), message: \(message), details: \(String(describing: details))")
                }
                
                print(error)
            }
            
            print(result?.data)
        }
    }
    
    static func getAllDevices(){
        
    }
    
    static func getAllConsumers(){
        
    }
    
    static func getAllGenerators(){
        
    }
}
