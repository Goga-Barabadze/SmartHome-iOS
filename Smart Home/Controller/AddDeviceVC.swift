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
    
    var titles = ["Name of Device", "Manufacturer", "Electricity"]
    var station = Station()
    var type_of_device: Device.Type? = Consumer.self
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        addDoneButton()
        setCorrectTitle()
    }
    
    fileprivate func setCorrectTitle(){
        let deviceTypeAsString = type_of_device == Consumer.self ? "Consumer" : "Producer"
        self.navigationItem.title = "Add \(deviceTypeAsString)"
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
        
        let electricity = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 2) as IndexPath) as! SimpleInputCell).input?.text
        
        if electricity == nil || electricity!.isEmpty {
            os_log("User did not enter electricity of device")
            Alert.alert(title: "No electricity", message: "Please enter the electricity input/output for the device you are adding")
            return
        }
        
        var device: Device = Device()
        
        if type(of: type_of_device) == Consumer.self {
            device = Consumer(name: name!, consumption: Int(electricity!) ?? 0, manufacturer: manufacturer!, state: .not_running)
            os_log("Added Consumer to station \(self.station.name)")
        }else{
            device = Producer(name: name!, manufacturer: manufacturer!, production: Int(electricity!) ?? 0, state: .not_running)
            os_log("Added Producer to station \(self.station.name)")
        }
        
        self.station.devices.append(device)
        
        Navigation.pop(context: self)
    }
    
    
}

extension AddDeviceVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        
        return cell
    }
}
