//
//  RegisterVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var titles = ["Name", "Email", "Password", "Confirm Password"]
    var placeholders = ["optional", "example@example.com", "••••••••", "••••••••"]
    
    @IBAction func register(_ sender: Any) {
        Account.createUser(email: "", password: "", target: self)
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
            return "By registering you agree to our Privacy Policy and Terms of Service"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}
