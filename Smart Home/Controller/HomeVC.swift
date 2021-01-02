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
    
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return refresher
    }()
    
    @objc func refresh(){
        
        refresher.endRefreshing()
    }
    
    var selected_station = 0
    var type_of_devices: Device.Type? = Consumer.self
    
    fileprivate func registerNibs() {
        let simple_title_cell = UINib(nibName: "SimpleTitleCell", bundle: nil)
        tableview.register(simple_title_cell, forCellReuseIdentifier: "SimpleTitleCell")
        
        let device_overview_cell = UINib(nibName: "DeviceOverviewCell", bundle: nil)
        tableview.register(device_overview_cell, forCellReuseIdentifier: "DeviceOverviewCell")
        
        let overview_weather_cell = UINib(nibName: "OverviewWeatherCell", bundle: nil)
        tableview.register(overview_weather_cell, forCellReuseIdentifier: "OverviewWeatherCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
        demoData()
        
        self.navigationItem.title = Greeting.message()
        
        self.tableview.refreshControl = refresher
    }
    

    func demoData(){
        
        let weather = Weather(description: "", temperature: 0.0, sunset: 0.0, sunrise: 0.0, datetime: 0.0)
        let weather2 = Weather(description: "", temperature: 0.0, sunset: 0.0, sunrise: 0.0, datetime: 0.0)
        let devices = [Consumer(id: "", averageConsumption: 100.0, company: "", name: "", serial: "", state: .running, type: ""), Consumer(id: "", averageConsumption: 100.0, company: "", name: "", serial: "", state: .running, type: "")]
//        let stations = [OldStation(name: "Main House", location: location, devices: devices), OldStation(name: "Summer House", location: location2, devices: devices)]
        let locations = [Location(id: "1", city: "Perg", country: "Austria", name: "Goga's house", zip: "4320", devices: devices)]
        let user = User(name: "Goga", email: "goga@gmail.com", stations: locations)
        
        _ = Model.init(user: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DevicesVC {
            vc.station = Model.user.stations[selected_station]
            vc.type_of_devices = self.type_of_devices
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
        return Model.user.stations.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTitleCell") as! SimpleTitleCell
            
            cell.commontInit(title: Model.user.stations[indexPath.section].name)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OverviewWeatherCell") as! OverviewWeatherCell
            
            let location = Model.user.stations[indexPath.section].city
            let weather = Model.user.stations[indexPath.section].weather
            
            cell.commonInit(city: location, temperature: "\(weather.temperature) °", image: UIImage(systemName: "sun.max")!, wind: "km/h", sunrise: "\(weather.sunrise)", sunset: "\(weather.sunset)", visibility: " km")
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceOverviewCell") as! DeviceOverviewCell
            
            cell.commontInit(color: UIColor(rgb: 0x147AFC))
            cell.textLabel!.text = "Photovoltaic"
            
//            let production = Model.user.stations[indexPath.section].currentProduction
//            cell.detailTextLabel!.text = "Currently producing \(production) Watts per hour"
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceOverviewCell") as! DeviceOverviewCell
            
            cell.commontInit(color: UIColor(rgb: 0x34C759))
            cell.textLabel!.text = "Devices"
            
//            let consumption = Model.user.stations[indexPath.section].currentConsumption
//            cell.detailTextLabel!.text = "Currently consuming \(consumption) Watts per hour"
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        
        case 2:
            selected_station = indexPath.section
            type_of_devices = Generator.self
            performSegue(withIdentifier: "showDevicesVC", sender: self)
        case 3:
            selected_station = indexPath.section
            type_of_devices = Consumer.self
            performSegue(withIdentifier: "showDevicesVC", sender: self)
        
        default:
            print("Not implemented yet")
        }
    }
}
