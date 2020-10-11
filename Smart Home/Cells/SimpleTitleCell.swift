//
//  SimpleTitleCell.swift
//  Smart Home
//
//  Created by Goga Barabadze on 22.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class SimpleTitleCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commontInit(title: String){
        self.title.text = title
        
        self.selectionStyle = .none
    }
}
