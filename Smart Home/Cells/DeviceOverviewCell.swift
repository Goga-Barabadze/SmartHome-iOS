//
//  DeviceOverviewCell.swift
//  Smart Home
//
//  Created by Goga Barabadze on 22.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class DeviceOverviewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commontInit(color: UIColor){
        self.detailTextLabel?.textColor = color
        
        self.selectionStyle = .none
    }
}
