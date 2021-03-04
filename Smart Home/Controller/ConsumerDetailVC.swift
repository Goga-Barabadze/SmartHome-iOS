//
//  ConsumerDetailVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class ConsumerDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var device = Device(id: "", name: "")
    var titles = ["Name", "Type Of Device", "Station", "Power", "Placeholder for Stats"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        addSaveButton()
        
        self.navigationItem.title = device.name
    }

    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }
    
    fileprivate func addSaveButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveDevice))
    }
    
    @objc func saveDevice(){
        // MARK: TODO Save Device
        
        navigationController?.popViewController(animated: true)
    }
}

extension ConsumerDetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
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
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        
        switch tableView.globalIndexPath(for: indexPath as NSIndexPath){
        case 0:
            cell.input.text = device.name
        case 1:
            cell.input.text = "Replace me with Type of Device"
        case 2:
            cell.input.text = "Replace me with location of device"
        case 3:
            cell.input.text = "Power of device"
        
        default:
            #warning("Not implemented yet")
        }
        
        return cell
    }
}
