//
//  CityListCell.swift
//  iOSProgrammingApp
//
//  Created by student on 11.01.16.
//  Copyright © 2016 Hackel & Keller. All rights reserved.
//

import UIKit

class CityListCell: UITableViewCell {

    @IBOutlet weak var LblCityName: UILabel!

    @IBOutlet weak var LblCountryName: UILabel!

    @IBOutlet weak var LblTemperature: UILabel!
    @IBOutlet weak var LblCondition: UILabel!

    //private static let naText: String = "N/A"

    func configureCellForCity(data: CityData) {
        LblCityName.text = Formatter.formatString(data.name)
        LblCondition.text = Formatter.formatString(data.currentWeather?.condition?.main)
        LblCountryName.text = Formatter.formatString(data.flag)
        LblTemperature.text = Formatter.formatTemp(data.currentWeather?.temperature?.temp)
    }
}
