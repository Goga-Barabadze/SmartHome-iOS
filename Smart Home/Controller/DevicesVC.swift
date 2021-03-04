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
    
    @IBOutlet weak var addButtonOutlet: UIBarButtonItem!
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "showAddConsumerVC", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        devices = location.devices.filter{type(of: $0) == type_of_devices}
        
        let deviceTypeAsString = type_of_devices == Consumer.self ? "Consumers" : "Producers"
        self.navigationItem.title = deviceTypeAsString  + " (" + location.name + ")"
        
        // Disable Add Button for Producers
        addButtonOutlet.isEnabled = type_of_devices == Consumer.self
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddConsumerVC {
            vc.location = location
        } else if let vc = segue.destination as? ConsumerDetailVC {
            vc.location = location
            vc.consumer = selected_device as? Consumer
        }
    }
}

extension DevicesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        devices.count
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
        
        var actions = [
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
                            self.location.devices.removeAll(where: {$0.id == id})
                            self.devices.removeAll(where: {$0.id == id})
                        }
                    }
                } else {
                    Networking.deleteGenerator(locationID: self.location.id, pvID: id) { (success) in
                        os_log("Delete Generator Success: \(success)")
                        
                        if success {
                            self.location.devices.removeAll(where: {$0.id == id})
                            self.devices.removeAll(where: {$0.id == id})
                        }
                    }
                }
                
                self.tableView.reloadData()
            })
        ]
        
        if self.type_of_devices == Consumer.self {
            actions.insert(UIAlertAction(title: "Toggle on and off", style: .default, handler: { (alertAction) in
                
                if self.type_of_devices == Consumer.self {
                    
                    let consumer = self.devices[indexPath.row]
                    let togglesModus = Device.State.modus(state: consumer.state)
                    let pvID = self.location.devices.first(where: {type(of: $0) == Generator.self})?.id.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    Networking.updateState(locationID: self.location.id, consumerID: consumer.id, modus: togglesModus, pvID: pvID ?? "") { (result) in
                        
                        consumer.state = Device.State.from(text: result ?? "NOT_RUNNING")
                        
                        self.tableView.reloadData()
                        
                    }
                }
            }), at: 0)
        }
        
        actions.append(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        Alert.alert(actions: actions)
    }
}
