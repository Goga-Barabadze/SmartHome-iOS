//
//  Navigation.swift
//  Smart Home
//
//  Created by Goga Barabadze on 23.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class Navigation {
    
    static func push(viewController: String, context: UIViewController = UIApplication.currentViewController()!){
        context.navigationController?.pushViewController(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController), animated: true)
    }
    
    static func present(controller: String, context: UIViewController = UIApplication.currentViewController()!){
        context.present((context.storyboard?.instantiateViewController(withIdentifier: controller))!, animated: true, completion: nil)
    }
    
    static func pop(context: UIViewController = UIApplication.currentViewController()!){
        context.navigationController?.popViewController(animated: true)
    }
}
