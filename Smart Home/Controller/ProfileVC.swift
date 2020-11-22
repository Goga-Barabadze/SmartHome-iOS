//
//  ProfileVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    func openNotificationSettings(){
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
            print("Settings opened: \(success)")
        })
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 3
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.accessoryType = .disclosureIndicator
        
        var text = ""
        var image_name = ""
        
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
            case 0:
                text = "Privacy Policy"
                image_name = "lock"
            case 1:
                text = "Help"
                image_name = "info.circle"
            case 2:
                text = "Rate the App"
                image_name = "heart"
            default:
                print("Could not find information for this cell index")
            }
            
        case 1:
            text = "Notifications"
            image_name = "app.badge"
        case 2:
            text = "Sign off"
            cell.accessoryType = .none
        default:
            print("Could not find information for this cell index")
        }
        
        cell.textLabel?.text = text
        cell.imageView?.image = UIImage(systemName: image_name)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
            case 0:
                
                performSegue(withIdentifier: "showPolicies", sender: self)
                
            default:
                print("Not implemented yet")
            }
            
        case 1:
            
            openNotificationSettings()
            
        case 2:
            
            performSegue(withIdentifier: "showWelcomeVC", sender: self)
            
        default:
            print("Not implemented yet")
        }
    }
}
