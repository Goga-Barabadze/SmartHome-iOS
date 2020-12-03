//
//  ViewController.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import os

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
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.init(red: 51, green: 131, blue: 236).cgColor,
            UIColor.init(red: 174, green: 251, blue: 219).cgColor
        ]
        gradient.locations = [0.2, 1]
        return gradient
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfManualLoginIsNeeded()
        
        setUpButtons()
        //setUpDesignView()
        
        let newColors = [
            UIColor.init(red: 174, green: 251, blue: 219).cgColor,
            UIColor.init(red: 51, green: 131, blue: 236).cgColor
        ]
        
        gradient.frame = view.bounds
        gradient.setColors(newColors,
                           animated: true,
                           withDuration: 4,
                           timingFunctionName: .linear)
        
        view.layer.insertSublayer(gradient, at: 0)
    }

    fileprivate func checkIfManualLoginIsNeeded(){
        if Networking.isLoggedIn() {
            os_log("Automatic login can be done.")
            performSegue(withIdentifier: "showHomeNC", sender: self)
        } else {
            os_log("Manual login is needed")
        }
    }
}

extension CAGradientLayer {
    
    func setColors(_ newColors: [CGColor],
                   animated: Bool = true,
                   withDuration duration: TimeInterval = 0,
                   timingFunctionName name: CAMediaTimingFunctionName? = nil) {
        
        if !animated {
            self.colors = newColors
            return
        }
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = colors
        colorAnimation.toValue = newColors
        colorAnimation.duration = duration
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = CAMediaTimingFillMode.forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)

        add(colorAnimation, forKey: "colorsChangeAnimation")
    }
}
