//
//  ForecastVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 20.04.21.
//  Copyright © 2021 Goga Barabadze. All rights reserved.
//

import UIKit
import os

class ForecastVC: UIViewController {

    var forecast: [Weather]!
    var location: Location!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibCells()
        
        Networking.getForecast(zip: location.zip) { (forecast) in
            
            guard let forecast = forecast else {
                os_log("Could not retreave forecast.")
                return
            }
            
            self.forecast = forecast
            self.tableView.reloadData()
        }
    }
    
    fileprivate func registerNibCells() {
        ["OverviewWeatherCell"]
            .forEach({tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)})
    }
}

extension ForecastVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OverviewWeatherCell") as! OverviewWeatherCell
        
        let weather = forecast[indexPath.row]
        
        cell.commonInit(city: "\(weather.time)", temperature: "\(weather.temperature) °", image: UIImage(systemName: "sun.max")!, sunrise: "", sunset: "", description: weather.description)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
