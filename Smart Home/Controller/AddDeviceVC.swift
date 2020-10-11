//
//  AddDeviceVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 27.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class AddDeviceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension AddDeviceVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
