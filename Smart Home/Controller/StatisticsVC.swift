//
//  StatisticsVC.swift
//  Smart Home
//
//  Created by Goga Barabadze on 16.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit

class StatisticsVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return refresher
    }()
    
    @objc func refresh(){
        refresher.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNibs()
        
        self.tableview.refreshControl = refresher
    }

    fileprivate func registerNibs() {
        let simple_title_cell = UINib(nibName: "StatsCell", bundle: nil)
        tableview.register(simple_title_cell, forCellReuseIdentifier: "StatsCell")
    }
}

extension StatisticsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "StatsCell") as! StatsCell
        
        cell.commontInit(title: ["Overview", "Main House", "Summer House"][indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
