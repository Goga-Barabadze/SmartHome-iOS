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
    
    var consumer: Consumer!
    var location: Location!
    var titles = ["Name", "Manufacturer", "Type", "Serial", "Electricity", "State", "Station"]
    var placeholders = ["Washing Machine", "Miele", "SMSNM123", "163785736", "100.0", "RUNNING", "Location 1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        addSaveButton()
        
        self.navigationItem.title = consumer.name
    }

    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }
    
    fileprivate func addSaveButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveDevice))
    }
    
    @objc func saveDevice(){
        
        consumer.name =         (tableView.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath) as! SimpleInputCell).input?.text ?? ""
        consumer.company =      (tableView.cellForRow(at: NSIndexPath(row: 1, section: 0) as IndexPath) as! SimpleInputCell).input?.text ?? ""
        consumer.type =         (tableView.cellForRow(at: NSIndexPath(row: 2, section: 0) as IndexPath) as! SimpleInputCell).input?.text ?? ""
        consumer.serial =       (tableView.cellForRow(at: NSIndexPath(row: 3, section: 0) as IndexPath) as! SimpleInputCell).input?.text ?? ""
        consumer.consumption =  Double((tableView.cellForRow(at: NSIndexPath(row: 4, section: 0) as IndexPath) as! SimpleInputCell).input?.text ?? "0") ?? 0
        consumer.state =        Device.State.from(text: (tableView.cellForRow(at: NSIndexPath(row: 5, section: 0) as IndexPath) as! SimpleInputCell).input?.text ?? "")
        
        let foundPV = location.devices.first(where: {type(of: $0) == Generator.self}) ?? Generator(id: "", type: "")
        Networking.updateConsumer(locationID: location.id, pvID: foundPV.id, consumer: consumer) { (success) in
            print("Update Consumer: \(success)")
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}

extension ConsumerDetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        let information = [
            consumer.name,
            consumer.company,
            consumer.type,
            consumer.serial,
            String(consumer.consumption),
            Device.State.from(state:  consumer.state),
            location.name
        ]
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        cell.input.placeholder = placeholders[indexPath.row]
        cell.input.text = information[indexPath.row]
        
        // Disable the last two inputs
        if indexPath.row >= titles.count - 2 {
            cell.isUserInteractionEnabled = false
        }
        
        return cell
    }
}
