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
        Utils.setValueOrDefault(&LblCityName.text, valueToSet: data.name, defaultValue: "N/A")
        Utils.setValueOrDefault(&LblCondition.text, valueToSet: data.currentWeather?.condition?.main, defaultValue: "N/A")
        Utils.setValueOrDefault(&LblCountryName.text, valueToSet: data.flag, defaultValue: "N/A")
        Utils.setValueOrDefault(&LblTemperature.text, valueToSet: data.currentWeather?.temperature?.temp, defaultValue: "N/A")
    }

}
