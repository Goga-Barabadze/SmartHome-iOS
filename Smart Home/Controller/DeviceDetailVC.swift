//
//  DeviceDetailVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class DeviceDetailVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var device = Device(name: "Test", state: .running)
    var titles = ["Name", "Type Of Device", "Station", "Power", "Placeholder for Stats"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        
        self.navigationItem.title = device.name
    }

    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }
}

extension DeviceDetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as! NSIndexPath)]
        
        return cell
    }
}
