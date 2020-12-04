//
//  Networking.swift
//  Smart Home
//
//  Created by Goga Barabadze on 28.10.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation
import FirebaseFunctions
import FirebaseAuth
import os

class Networking {
    
    static func call(function: String, with arguments: [String : Any]?, closure: @escaping ([String: Any]?, NSError?) -> ()){
        
        Functions.functions().httpsCallable(function).call(arguments) { (result, error) in
            
            if let error = error as NSError? {
                
                if error.domain == FunctionsErrorDomain {
                    
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    
                    print("code: \(String(describing: code)), message: \(message), details: \(String(describing: details))")
                }
                
                closure(nil, error)
            }
            
            if let data = (result?.data as? [String: Any]) {
                closure(data, nil)
                return
            }
            
            closure(nil, nil)
        }
    }
    
    static func getAllDevices(){
        
    }
    
    static func getAllConsumers(){
        
    }
    
    static func getAllGenerators(){
        
    }
    
    static func isLoggedIn() -> Bool {
        return FirebaseAuth.Auth.auth().currentUser != nil
    }
    
    static func signOut() {
        do{
            try FirebaseAuth.Auth.auth().signOut()
        } catch let error as NSError {
            print(error)
            os_log("Could not properly log out user.")
        }
    }
}
