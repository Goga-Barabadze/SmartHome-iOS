//
//  Extensions.swift
//  Smart Home
//
//  Created by Goga Barabadze on 17.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication{

    class func currentViewController() -> UIViewController? {

        var presentViewController = UIApplication.shared.keyWindow?.rootViewController

        while let pVC = presentViewController?.presentedViewController{
            presentViewController = pVC
        }

        return presentViewController
    }

}

extension UITableView {
    func globalIndexPath(for localIndexPath: NSIndexPath) -> Int {
        var totalRows = 0
        for i in 0..<localIndexPath.section {
            totalRows += self.numberOfRows(inSection: i)
        }
        return totalRows + localIndexPath.row
    }
}


extension UIView {
    
    func roundCorners(radius: CGFloat, masksToBounds: Bool = false) {
        
        self.layer.masksToBounds = masksToBounds
        self.layer.cornerRadius = radius
        
    }
    
    func addShadow(radius: CGFloat = 4.0, opacity: Float = 0.2, offset: CGSize = CGSize(width: 3, height: 3), color: UIColor = .black) {
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        
    }
    
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension String {
    mutating func unescape() -> String {
        self = self.replacingOccurrences(of: "\"", with: "")
        return self
    }
}

extension UIView {
    
    func gradient(colors: [UIColor] = [.blue, .white], locations: [NSNumber] = [0, 2], startPoint: CGPoint = CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0), type: CAGradientLayerType = .axial){
        
        let gradient = CAGradientLayer()
        
        gradient.frame.size = self.frame.size
        gradient.frame.origin = CGPoint(x: 0.0, y: 0.0)

        gradient.colors = colors.map{ $0.cgColor }
        
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        gradient.type = type
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
