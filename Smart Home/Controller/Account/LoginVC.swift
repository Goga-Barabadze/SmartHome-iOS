//
//  LoginVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import os

class LoginVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var titles = ["Email", "Password"]
    var placeholders = ["example@example.com", "••••••••"]
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath) as! SimpleInputCell).input?.text else {
            os_log("User did not enter email")
            Alert.alert(title: "No email", message: "Please enter your email")
            return
        }
        
        guard let password = (tableview.cellForRow(at: NSIndexPath(row: 1, section: 0) as IndexPath) as! SimpleInputCell).input?.text else {
            os_log("User did not enter password")
            Alert.alert(title: "No password", message: "Please enter your password")
            return
        }
        
        Account.signIn(email: email, password: password, target: self, closure: {authResult, error in
            if authResult?.user != nil && error == nil {
                os_log("User is logged in now")
            }else{
                Alert.alert(title: "No Success", message: "Could not login. Please try again.")
            }
        })
    }

    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
    }
}

extension LoginVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        cell.commonInit(title: titles[indexPath.row], placeholder: placeholders[indexPath.row])
        
        if indexPath.row == 1 {
            cell.input.isSecureTextEntry = true
        }
        
        #if DEBUG
            cell.input.text = (indexPath.row == 0) ? "goga.barabadze73@gmail.com" : "Qwertz73!"
        #endif
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}
