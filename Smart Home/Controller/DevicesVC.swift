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
    
    var station = Station()
    var devices = [Device]()
    var type_of_devices: Device.Type? = Consumer.self
    
    override func viewWillAppear(_ animated: Bool) {
        devices = station.devices.filter{type(of: $0) == type_of_devices} ?? []
        
        let deviceTypeAsString = type_of_devices == Consumer.self ? "Consumers" : "Producers"
        self.navigationItem.title = deviceTypeAsString  + " (" + station.name + ")"
        
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddDeviceVC {
            vc.station = station
            vc.type_of_device = type_of_devices
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
}
