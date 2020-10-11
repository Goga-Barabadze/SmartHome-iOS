//
//  ViewController.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var design_view: UIView!
    
    fileprivate func setUpButtons() {
        login.roundCorners(radius: 10)
        login.addShadow()
        
        register.roundCorners(radius: 10)
        register.addShadow()
    }
    
    fileprivate func setUpDesignView() {
        design_view.roundCorners(radius: 20)
        design_view.addShadow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
        setUpDesignView()
    }


}

