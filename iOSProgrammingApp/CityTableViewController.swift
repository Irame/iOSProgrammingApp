//
//  ViewController.swift
//  iOSProgrammingApp
//
//  Created by student on 19.12.15.
//  Copyright (c) 2015 Hackel & Keller. All rights reserved.
//


import UIKit


class CityTableViewController: UITableViewController {

    var city : [CityData] = [] //Demo Data

    override func viewDidLoad() {
    super.viewDidLoad()
    var wue = CityData(name:"Wuerzburg",country:"Deutschland")
    var sw = CityData(name:"Schweinfurt",country:"Deutschland")
        
        city.append(wue)
        city.append(sw)
        
    // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (city.count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //get Cell with the Identifier from Storyboard!!
        let cell = tableView.dequeueReusableCellWithIdentifier("CitylistCellIdentifier") as! CityListCell
        //indexPath.section
        
        print("\(indexPath.section) -  \(indexPath.row)")
        let currentCity = city[indexPath.row]
        cell.configureCellForCity(currentCity)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //        sender
        if segue.identifier == "cityDetailIdentifier"{
            
            let indexPath = tableView.indexPathForSelectedRow!
            let currentCity = city[indexPath.row]
            
            let d = segue.destinationViewController as! CityDetailViewController
            d.city = currentCity
            
        }

    }

}
