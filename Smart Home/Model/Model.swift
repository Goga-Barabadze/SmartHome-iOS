//
//  Model.swift
//  Smart Home
//
//  Created by Goga Barabadze on 17.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation

class Model {
    
    static var user = User()
    
    init(user: User) {
        Model.user = user
    }
}
