//
//  DevicesVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 23.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import os

class DevicesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var location = Location()
    var devices = [Device]()
    var type_of_devices: Device.Type? = Consumer.self
    var selected_device = Device()
    
    override func viewWillAppear(_ animated: Bool) {
        devices = location.devices.filter{type(of: $0) == type_of_devices}
        
        let deviceTypeAsString = type_of_devices == Consumer.self ? "Consumers" : "Producers"
        self.navigationItem.title = deviceTypeAsString  + " (" + location.name + ")"
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddDeviceVC {
            vc.location = location
        } else if let vc = segue.destination as? DeviceDetailVC {
            vc.device = selected_device
        }
    }
}

extension DevicesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "DeviceCell")
        
        cell.textLabel?.text = devices[indexPath.row].name
        cell.detailTextLabel?.text = devices[indexPath.row].state.rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            let removedDevice = devices.remove(at: indexPath.row)
//            location.devices.removeAll { (device) -> Bool in
//                return removedDevice.name == device.name
//            }
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Alert.alert(actions: [
            UIAlertAction(title: "Show Details", style: .default, handler: { (alertAction) in
                self.selected_device = self.devices[indexPath.row]
                self.performSegue(withIdentifier: "showDeviceDetailVC", sender: self)
            }),
            
            UIAlertAction(title: "Remove Device", style: .destructive, handler: { (alertAction) in
                
                let id = self.devices[indexPath.row].id
                
                if self.type_of_devices == Consumer.self {
                    Networking.deleteConsumer(locationID: self.location.id, consumerID: id) { (success) in
                        os_log("Delete Consumer Success: \(success)")
                        
                        if success {
                            self.devices.removeAll(where: {$0.id == id})
                        }
                    }
                } else {
                    Networking.deleteGenerator(locationID: self.location.id, pvID: id) { (success) in
                        os_log("Delete Generator Success: \(success)")
                        
                        if success {
                            self.devices.removeAll(where: {$0.id == id})
                        }
                    }
                }
                
                self.tableView.reloadData()
            }),
            
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ])
    }
}
