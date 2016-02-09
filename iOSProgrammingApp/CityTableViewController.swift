//
//  ViewController.swift
//  iOSProgrammingApp
//
//  Created by student on 19.12.15.
//  Copyright (c) 2015 Hackel & Keller. All rights reserved.
//


import UIKit


class CityTableViewController: UITableViewController {
    @IBOutlet var favoriteTableView: UITableView!

    var cityData: [CityData] = []
    //Demo Data

    override func viewDidLoad() {
        super.viewDidLoad()

        JsonHelper.requestCurCityData("Wuerzburg", callback: {
            cd in self.cityData.append(cd)
            self.favoriteTableView.reloadData()
        })

        // Do any additional setup after loading the view, typically from a nib.

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //get Cell with the Identifier from Storyboard!!
        let cell = tableView.dequeueReusableCellWithIdentifier("CitylistCellIdentifier") as! CityListCell
        //indexPath.section

        print("\(indexPath.section) -  \(indexPath.row)")
        let currentCity = cityData[indexPath.row]
        cell.configureCellForCity(currentCity)

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //        sender
        if segue.identifier == "cityDetailIdentifier" {

            let indexPath = tableView.indexPathForSelectedRow!
            let currentCity = cityData[indexPath.row]

            let d = segue.destinationViewController as! CityDetailViewController
            d.city = currentCity

        }

    }

}
