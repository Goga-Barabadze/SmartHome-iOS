//
//  DevicesVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 23.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class DevicesVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var location = Location()
    var devices = [Device]()
    var type_of_devices: Device.Type? = Consumer.self
    var selected_device = Device()
    
    override func viewWillAppear(_ animated: Bool) {
        devices = location.devices.filter{type(of: $0) == type_of_devices}
        
        let deviceTypeAsString = type_of_devices == Consumer.self ? "Consumers" : "Producers"
        self.navigationItem.title = deviceTypeAsString  + " (" + location.name + ")"
        
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddDeviceVC {
            vc.location = location
            vc.type_of_device = type_of_devices
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let removedDevice = devices.remove(at: indexPath.row)
            location.devices.removeAll { (device) -> Bool in
                return removedDevice.name == device.name
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected_device = devices[indexPath.row]
        performSegue(withIdentifier: "showDeviceDetailVC", sender: self)
    }
}
