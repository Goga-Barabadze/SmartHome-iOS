//
//  HomeVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import FirebaseFunctions

class HomeVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var selected_location = 0
    var type_of_devices: Device.Type? = Consumer.self
    var forecast = [Weather]()
    static var load_needed = true
    
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return refresher
    }()
    
    @objc func refresh(){
        loadData()
    }
    
    fileprivate func registerNibCells() {
        ["SimpleTitleCell", "DeviceOverviewCell", "OverviewWeatherCell"]
            .forEach({tableview.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)})
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if HomeVC.load_needed {
            loadData()
            HomeVC.load_needed = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibCells()
        
        self.navigationItem.title = Greeting.message()
        
        self.tableview.refreshControl = refresher
    }
    

    func loadData(){
        
        User.main.locations.removeAll()
        tableview.reloadData()
        
        Networking.loadLocationsWithDepth(email: User.main.email) { (locations) in

            User.main.locations = locations

            self.tableview.reloadData()

            self.refresher.endRefreshing()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DevicesVC {
            vc.location = User.main.locations[selected_location]
            vc.type_of_devices = self.type_of_devices
        } else if let vc = segue.destination as? AddConsumerVC {
            vc.location = User.main.locations[selected_location]
        } else if let vc = segue.destination as? ForecastVC {
            vc.location = User.main.locations[selected_location]
            vc.forecast = forecast
        }
    }

}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return User.main.locations.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTitleCell") as! SimpleTitleCell
            
            cell.commontInit(title: User.main.locations[indexPath.section].name)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OverviewWeatherCell") as! OverviewWeatherCell
            
            let location = User.main.locations[indexPath.section]
            let weather = location.weather
            
            cell.commonInit(city: location.city, temperature: "\(weather.temperature) °", image: UIImage(systemName: "sun.max")!, sunrise: "\(weather.formattedSunrise)", sunset: "\(weather.formattedSunset)", description: weather.description)
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceOverviewCell") as! DeviceOverviewCell
            
            cell.commontInit(color: UIColor(rgb: 0x147AFC))
            cell.textLabel!.text = "Photovoltaic"
            
            let production = User.main.locations[indexPath.section].currentProduction
            cell.detailTextLabel!.text = "Currently producing \(production) Watts per hour"
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceOverviewCell") as! DeviceOverviewCell
            
            cell.commontInit(color: UIColor(rgb: 0x34C759))
            cell.textLabel!.text = "Devices"
            
            let consumption = User.main.locations[indexPath.section].currentConsumption
            cell.detailTextLabel!.text = "Currently consuming \(consumption) Watts per hour"
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 170
        case 2...3:
            return 85
        default:
            return 44
        }
    }
    
    fileprivate func askIfShouldDeleteLocation(_ indexPath: IndexPath, _ tableView: UITableView) {
        Alert.alert(title: nil, message: nil, actions: [
            UIAlertAction(title: "Delete Location", style: .destructive, handler: { (alertAction) in
                let idOfLocationToRemove = User.main.locations[indexPath.section].id
                Networking.deleteLocation(email: User.main.email, locationID: idOfLocationToRemove) { (success) in
                    
                    print("Did successfully delete location: \(success)")
                    
                    if success {
                        User.main.locations.removeAll(where: {$0.id == idOfLocationToRemove})
                        tableView.reloadData()
                    }
                }
            }),
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            askIfShouldDeleteLocation(indexPath, tableView)
        case 1:
            selected_location = indexPath.section
            performSegue(withIdentifier: "showForecastVC", sender: self)
        case 2:
            selected_location = indexPath.section
            type_of_devices = Generator.self
            performSegue(withIdentifier: "showDevicesVC", sender: self)
        case 3:
            selected_location = indexPath.section
            type_of_devices = Consumer.self
            performSegue(withIdentifier: "showDevicesVC", sender: self)
        
        default:
            print(indexPath.row)
        }
    }
}
