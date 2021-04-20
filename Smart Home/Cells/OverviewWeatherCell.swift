//
//  OverviewWeatherCell.swift
//  Smart Home
//
//  Created by Goga Barabadze on 18.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class OverviewWeatherCell: UITableViewCell {

    @IBOutlet weak var design_view: UIView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weather_image: UIImageView!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var descriptionOfWeather: UILabel!
    @IBOutlet weak var sunset: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func commonInit(city: String, temperature: String, image: UIImage, sunrise: String, sunset: String, description: String){
        
        self.city.text = city
        self.temperature.text = temperature
        self.weather_image.image = image
        self.sunrise.text = sunrise
        self.sunset.text = sunset
        self.descriptionOfWeather.text = description
        
        design_view.roundCorners(radius: 20, masksToBounds: true)
        design_view.gradient(colors: [.init(rgb: 0x5BBDB), .black], locations: [0, 3])
        
        if description.contains("cloud"){
            self.weather_image.image = UIImage(systemName: "cloud")
        } else if description.contains("rain") {
            self.weather_image.image = UIImage(systemName: "cloud.rain")
        }
        
        self.selectionStyle = .none
    }
}
