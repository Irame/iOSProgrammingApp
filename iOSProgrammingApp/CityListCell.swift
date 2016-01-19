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
    func configureCellForCity(data: CityData) {
        LblCityName.text = data.name
        LblTemperature.text = String(data.currentWeather?.currentTemperature)
        LblCondition.text = "none"
        LblCountryName.text = data.country
    }
}
