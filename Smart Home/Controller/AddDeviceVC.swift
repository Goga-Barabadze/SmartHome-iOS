//
//  AddDeviceVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 27.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import os

class AddDeviceVC: UIViewController {
    
    var titles = ["Name", "Manufacturer", "Electricity"]
    var placeholders = ["Washing Machine", "Samsung", "38.0"]
    var location = Location()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        addDoneButton()
        setCorrectTitle()
    }
    
    fileprivate func setCorrectTitle(){
        self.navigationItem.title = "Add Consumer"
    }
    
    fileprivate func addDoneButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addDevice))
    }

    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }
    
    @objc func addDevice(){
        
        let name = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath) as! SimpleInputCell).input?.text
        
        if name == nil || name!.isEmpty {
            os_log("User did not enter name of device")
            Alert.alert(title: "No Name", message: "Please enter a name for the device you are adding")
            return
        }
        
        let manufacturer = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 1) as IndexPath) as! SimpleInputCell).input?.text
        
        if manufacturer == nil || manufacturer!.isEmpty {
            os_log("User did not enter company of device")
            Alert.alert(title: "No Company", message: "Please enter a company for the device you are adding")
            return
        }
        
        let electricity = Double((tableview.cellForRow(at: NSIndexPath(row: 0, section: 2) as IndexPath) as! SimpleInputCell).input?.text ?? "0")
        
        if electricity == nil {
            os_log("User did not enter electricity of device")
            Alert.alert(title: "No electricity", message: "Please enter the electricity input/output for the device you are adding")
            return
        }
        
        let consumer = Consumer(id: "", averageConsumption: electricity!, company: manufacturer!, name: name!, serial: "", state: .not_running, type: "")
        
        os_log("Added Consumer to location \(self.location.name)")
        
        Networking.addConsumer(email: User.main.email, locationID: location.id, consumer: consumer) { (_, _) in
            
            HomeVC.load_needed = true
            self.navigationController?.popViewController(animated: true)
            
        }
    }
}

extension AddDeviceVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        cell.input.placeholder = placeholders[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        
        return cell
    }
}
