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
    
    var titles = ["Name of Device", "Company"]
    var station = Station()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        addDoneButton()
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
        
        let company = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 1) as IndexPath) as! SimpleInputCell).input?.text
        
        if company == nil || company!.isEmpty {
            os_log("User did not enter company of device")
            Alert.alert(title: "No Company", message: "Please enter a company for the device you are adding")
            return
        }
        
        let device = Device(name: name!, company: company!, state: .not_running)
        
        station.devices.append(device)
        
        if #available(iOS 14.0, *) {
            os_log("Added Device to station \(self.station.name)")
        }
    }
}

extension AddDeviceVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as! NSIndexPath)]
        
        return cell
    }
}
