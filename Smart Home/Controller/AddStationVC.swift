//
//  AddDeviceVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class AddStationVC: UIViewController {

    var titles = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
//        Station(name: <#T##String#>, location: <#T##Location#>, devices: <#T##[Device]#>)
    }
    
    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        //tableview.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }

}

extension AddStationVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
