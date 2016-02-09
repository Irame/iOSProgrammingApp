//
//  SettingsViewController.swift
//  iOSProgrammingApp
//
//  Created by Julius on 26.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var temperatureUnitSelector: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.temperatureUnitSelector.selectedSegmentIndex = Settings.loadTempUnitIndex()
    }

    @IBAction func selectorValueChanged(sender: UISegmentedControl) {
        Settings.saveTempUnitIndex(sender.selectedSegmentIndex)
    }
}
