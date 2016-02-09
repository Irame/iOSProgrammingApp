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
        LblCityName.text = data.name
        if let temp = data.currentWeather?.currentTemperature {
            LblTemperature.text = String(format: "%.1f°", temp)
        } else {
            LblTemperature.text = String("--")
        }
        
        LblCondition.text = "none"
        LblCountryName.text = data.country
    }

}
