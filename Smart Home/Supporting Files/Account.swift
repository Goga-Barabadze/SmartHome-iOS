//
//  Account.swift
//  Smart Home
//
//  Created by Goga Barabadze on 17.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation
import Firebase

class Account {
    
    static func createUser(email: String, password: String, target: UIViewController) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                print(error.debugDescription)
                Alert.alert(title: "Something went wrong", message: error?.localizedDescription, target: target)
                
            }
            
            print(authResult?.user.email)
            
        }
        
    }
    
    static func signIn(email: String, password: String, target: UIViewController) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                print(error.debugDescription)
                Alert.alert(title: "Something went wrong", message: error?.localizedDescription, target: target)
            }
            
            print(authResult?.user.email)
        }
    }
    
    static func amILoggedIn() -> Bool{
        return true
    }
}
