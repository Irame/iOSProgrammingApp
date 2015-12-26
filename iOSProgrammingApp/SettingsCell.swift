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
    
    
    func configureCellForSetting(data: String) {
    settingLbl.text = data
    }
}
