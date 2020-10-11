//
//  LoginVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var titles = ["Email", "Password"]
    var placeholders = ["example@example.com", "••••••••"]
    
    @IBAction func login(_ sender: Any) {
        Account.signIn(email: "goga.barabadze73@gmail.com", password: "Qwertz73!", target: self)
        
        if Account.amILoggedIn(){
            // Preceed to main screen
        }else{
            Alert.alert(title: "No Success", message: "Could not login. Please try again.")
        }
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}
