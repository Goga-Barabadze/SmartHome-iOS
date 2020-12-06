//
//  Alert.swift
//  Smart Home
//
//  Created by Goga Barabadze on 17.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    static func alert(title: String?, message: String?, target: UIViewController? = UIApplication.currentViewController()!, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default, handler: nil)]){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = target?.view
            popoverController.sourceRect = CGRect(x: (target?.view.bounds.midX)!, y: (target?.view.bounds.midY)!, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        for action in actions {
            alert.addAction(action)
        }
        
        target?.present(alert, animated: true, completion: nil)
        
    }
    
}
