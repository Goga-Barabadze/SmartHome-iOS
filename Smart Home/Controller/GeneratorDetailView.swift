//
//  GeneratorDetailVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 20.04.21.
//  Copyright © 2021 Goga Barabadze. All rights reserved.
//

import UIKit

class GeneratorDetailVC: UIViewController {

    var generator: Generator!
    var location: Location!
    var titles = ["Name", "Type", "Electricity", "Location"]
    var placeholders = ["Washing Machine", "Fronius", "2921.0", "Location 1"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        
        self.navigationItem.title = generator.name
    }
    
    fileprivate func registerNibs() {
        let nibName = UINib(nibName: "SimpleInputCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SimpleInputCell")
    }

}

extension GeneratorDetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleInputCell") as! SimpleInputCell
        
        let information = [
            generator.name,
            generator.type,
            String(generator.production),
            location.name
        ]
        
        cell.title.text = titles[tableView.globalIndexPath(for: indexPath as NSIndexPath)]
        cell.input.placeholder = placeholders[indexPath.row]
        cell.input.text = information[indexPath.row]
        
        cell.isUserInteractionEnabled = false
        
        return cell
    }
}
