//
//  SettingsCell.swift
//  iOSProgrammingApp
//
//  Created by student on 26.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var settingLbl: UILabel!

    @IBOutlet weak var settingValue: UILabel!

    func configureCellForSetting(name: String, value: String) {
        settingLbl.text = name
        settingValue.text = value
    }
    @IBAction func switchPressed(sender: UISwitch) {
        var changed = false
        
         if(settingLbl.text == "Temperature Type") {
        switch settingValue.text! {
        case "°C":
            if(!changed) {
            settingValue.text = "°F"
                changed = true
            }
            break
        
        case "°F":
            if(!changed) {
            settingValue.text = "°C"
                changed = true
            }
            break
            
        default: break
        }
        }
    }
}
