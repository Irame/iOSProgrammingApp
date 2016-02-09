//
//  SettingsViewController.swift
//  iOSProgrammingApp
//
//  Created by Julius on 26.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let settings: [String] = ["Temperature Type", "TestSetting"]

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //get Cell with the Identifier from Storyboard!!
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingCellIdentifier") as! SettingsCell
        //indexPath.section

        print("\(indexPath.section) -  \(indexPath.row)")
        let setting = settings[indexPath.row]
        cell.configureCellForSetting(setting)

        return cell
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    /*func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //tableView.beginUpdates()
        switch editingStyle {
        case .Delete:
            print("löschen")
            settings.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            print("nichts machen")
        }
        //tableView.endUpdates()
    }*/

}
