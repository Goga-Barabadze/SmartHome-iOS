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
    
    func commonInit(city: String, temperature: String, image: UIImage, wind: String, sunrise: String, sunset: String, visibility: String){
        
        self.city.text = city
        self.temperature.text = temperature
        self.weather_image.image = image
        self.wind.text = wind
        self.sunrise.text = sunrise
        self.sunset.text = sunset
        self.visibility.text = visibility
        
        design_view.roundCorners(radius: 20, masksToBounds: true)
        design_view.gradient(colors: [.init(rgb: 0x5BBDB), .black], locations: [0, 3])
        
        // Testing
        design_view.gradient()
        
        // Two Colors
        design_view.gradient(colors: [.init(rgb: 0x5BBDB), .black], locations: [0, 3])
        
        // Full Blown
        design_view.gradient(colors: [.init(rgb: 0x5BBDB), .black], locations: [0, 3], startPoint: CGPoint(x: 0.0, y: 1.5), endPoint: CGPoint(x: 1.0, y: 2.0), type: .axial)
        
        self.selectionStyle = .none
    }
}

extension UIView {
    
    func gradient(colors: [UIColor] = [.blue, .white], locations: [NSNumber] = [0, 2], startPoint: CGPoint = CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0), type: CAGradientLayerType = .axial){
        
        let gradient = CAGradientLayer()
        
        gradient.frame.size = self.frame.size
        gradient.frame.origin = CGPoint(x: 0.0, y: 0.0)

        gradient.colors = colors.map{ $0.cgColor }
        
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        gradient.type = type
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
