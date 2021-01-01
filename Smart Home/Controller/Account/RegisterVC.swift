//
//  RegisterVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import os

class RegisterVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var titles = ["Name", "Email", "Password", "Confirm Password"]
    var placeholders = ["optional", "example@example.com", "••••••••", "••••••••"]
    
    @IBAction func register(_ sender: Any) {
        
        let email = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 1) as IndexPath) as! SimpleInputCell).input?.text
        
        let password = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 2) as IndexPath) as! SimpleInputCell).input?.text
        
        let password_confirmed = (tableview.cellForRow(at: NSIndexPath(row: 1, section: 2) as IndexPath) as! SimpleInputCell).input?.text
        
        if email == nil || email!.isEmpty {
            os_log("User did not enter email")
            Alert.alert(title: "No email", message: "Please enter a valid email")
            return
        }
        
        if password == nil || password!.isEmpty {
            os_log("User did not enter password")
            Alert.alert(title: "No password", message: "Please a password")
            return
        }
        
        if password_confirmed == nil || password_confirmed!.isEmpty {
            os_log("User did not enter password confirmation")
            Alert.alert(title: "No password confirmation", message: "Please enter the password confirmation")
            return
        }
        
        if password != password_confirmed {
            Alert.alert(title: "Password not confirmed correctly", message: "The password confimation and the password do not match.")
            return
        }
        
        Account.createUser(email: email!, password: password!, target: self) { (authDataResult, error) in
            
            if error != nil {
                return
            }
            
            self.performSegue(withIdentifier: "showHomeNC", sender: self)
        }
    }
    
    fileprivate func registerNibs() {
        let simple_input_cell_nib = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableview.register(simple_input_cell_nib, forCellReuseIdentifier: "SimpleInputCell")
        
        let simple_button_cell_nib = UINib(nibName: "SimpleButtonCell", bundle: nil)
        tableview.register(simple_button_cell_nib, forCellReuseIdentifier: "SimpleButtonCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
    }

    @objc func showPolicies(){
        performSegue(withIdentifier: "showPolicies", sender: self)
    }
}

extension RegisterVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 2 {
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section >= 0 && indexPath.section <= 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
            
            cell.commonInit(title: titles[tableView.globalIndexPath(for: indexPath as NSIndexPath)], placeholder: placeholders[tableView.globalIndexPath(for: indexPath as NSIndexPath)])
            
            if indexPath.section == 2 {
                cell.input.isSecureTextEntry = true
            }
            
            #if DEBUG
                if indexPath.section == 0 {
                    cell.input.text = "Test User"
                } else if indexPath.section == 1{
                    cell.input.text = "fakeemail@something.com"
                } else {
                    cell.input.text = "gogagoga"
                }
            #endif
            
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleButtonCell") as! SimpleButtonCell
            
            cell.commontInit(title: "Privacy Policy & Terms of Service", target: #selector(showPolicies), context: self)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 1:
            return "You'll receive an email for confirmation."
        case 2:
            return "Choose a strong password with at least 6 characters."
        case 3:
            return "By registering you agree to our Privacy Policy and Terms of Service."
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}
