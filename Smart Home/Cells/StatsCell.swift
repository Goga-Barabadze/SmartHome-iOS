//
//  StatsCell.swift
//  Smart Home
//
//  Created by Goga Barabadze on 23.07.20.
//  Copyright © 2020 Goga Barabadze. All rights reserved.
//

import UIKit
import Charts

class StatsCell: UITableViewCell, ChartViewDelegate {
    
    @IBOutlet weak var chart: BarChartView!
    @IBOutlet weak var design_view: UIView!
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
        
        let set1 = BarChartDataSet(entries: chartValues)
        set1.setColor(.systemGreen)
        set1.stackLabels.removeAll()
        
        let data = BarChartData(dataSet: set1)
        data.setValueTextColor(UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0))
        
        chart.data = data
        
        chart.rightAxis.enabled = false
        chart.leftAxis.enabled = false
        
        chart.rightAxis.setLabelCount(0, force: true)
        chart.leftAxis.setLabelCount(0, force: true)
        chart.drawValueAboveBarEnabled = false
        chart.leftAxis.gridLineWidth = 0
        chart.rightAxis.gridLineWidth = 0
        chart.leftAxis.zeroLineWidth = 0
        chart.rightAxis.zeroLineWidth = 0
        chart.legend.enabled = false
        
        chart.noDataText = "Not enough data."
        
        chart.isUserInteractionEnabled = false
        
        chart.animate(yAxisDuration: 1, easingOption: .easeInSine)
        
        chart.gridBackgroundColor = .white
        chart.drawGridBackgroundEnabled = false
        
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        chart.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        chart.xAxis.granularity = 1
        
        
        self.design_view.addShadow()
        self.design_view.roundCorners(radius: 20)
        
        
        self.selectionStyle = .none
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    let chartValues: [BarChartDataEntry] = [
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
        BarChartDataEntry(x: Double(arc4random_uniform(12)), y: Double(arc4random_uniform(100))),
    ]
}
