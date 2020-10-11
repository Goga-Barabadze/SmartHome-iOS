//
//  SimpleInputCell.swift
//  Smart Home
//
//  Created by Goga Barabadze on 18.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class SimpleInputCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var input: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(title: String, placeholder: String){
        self.title.text = title
        self.input.placeholder = placeholder
        self.selectionStyle = .none
    }
}
