//
//  cityDetailForecastCell.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import UIKit
import Foundation

class CityDetailForecastCell: UITableViewCell {
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var forecastLbl: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!

    @IBOutlet weak var forecastTimeLbl: UILabel!
    
    func configureCellForForecast(data: WeatherData) {
        dateLbl.text = Formatter.formatDate(data.date)
        forecastLbl.text = Formatter.formatTemp(data.temperature?.temp)
        weatherImageView.image = UIImage(named: data.condition!.icon!)
    }
}
