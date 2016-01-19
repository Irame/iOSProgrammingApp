//
//  cityDetailForecastCell.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import UIKit

class CityDetailForecastCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var forecastLbl: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!

    func configureCellForForecast(data: WeatherData) {
        dateLbl.text = data.date
        forecastLbl.text = String(data.currentTemperature)
    }
}
