//
//  AddLocationVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import os

class AddLocationVC: UIViewController {

    var titles = ["PVID"]
    var placeholders = ["e.g. f5b8a9f8-9432-47fe-9875-3030bf74e92f"]
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        addAddButton()
    }
    
    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }
    
    fileprivate func addAddButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addLocation))
    }
    
    @objc func addLocation(){
        
        guard let pvID = (tableview.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath) as! SimpleInputCell).input?.text else {
            Alert.alert(title: "Please enter the PVID to add location", message: nil)
            return
        }
        
        Networking.getFroniusLocation(pvID: pvID) { (location) in
            guard let location = location else {
                os_log("Error with location fetching.")
                return
            }
            Networking.addLocation(email: User.main.email, location: location) { (locationID) in
                guard let locationID = locationID else {
                    os_log("Could not get locationID")
                    return
                }
                Networking.addPV(email: User.main.email, locationID: locationID, pvID: pvID) { (_, _) in
                    HomeVC.load_needed = true
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}

extension AddLocationVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        cell.input.placeholder = placeholders[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        
        #if DEBUG
            cell.input.text = "f5b8a9f8-9432-47fe-9875-3030bf74e92f"
        #endif
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Add one PV and we will add the location of the PV for you."
    }
}
