//
//  SimpleButtonCell.swift
//  Smart Home
//
//  Created by Goga Barabadze on 18.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class SimpleButtonCell: UITableViewCell {

    @IBOutlet weak var outlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commontInit(title: String, target: Selector, context: UIViewController){
        outlet.setTitle(title, for: .normal)
        outlet.addTarget(context, action: target, for: .touchUpInside)
        
        self.selectionStyle = .none
    }
}
