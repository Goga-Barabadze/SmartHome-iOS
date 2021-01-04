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
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var visibility: UILabel!
    @IBOutlet weak var sunset: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(city: String, temperature: String, image: UIImage, sunrise: String, sunset: String, description: String){
        
        self.city.text = city
        self.temperature.text = temperature
        self.weather_image.image = image
//        self.wind.text = wind
        self.sunrise.text = sunrise
        self.sunset.text = sunset
        self.visibility.text = description
        
        design_view.roundCorners(radius: 20, masksToBounds: true)
        design_view.gradient(colors: [.init(rgb: 0x5BBDB), .black], locations: [0, 3])
        
        self.selectionStyle = .none
    }
}
