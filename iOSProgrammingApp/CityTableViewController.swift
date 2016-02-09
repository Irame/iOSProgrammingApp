//
//  ViewController.swift
//  iOSProgrammingApp
//
//  Created by student on 19.12.15.
//  Copyright (c) 2015 Hackel & Keller. All rights reserved.
//


import UIKit
import GoogleMaps

class CityTableViewController: UITableViewController, GMSAutocompleteViewControllerDelegate {
    @IBOutlet var favoriteTableView: UITableView!

    var cityData: [CityData] = []
    //Demo Data

    private static let userDefaultsFavoritesKey:String = "favorites"

    var acController:GMSAutocompleteViewController = GMSAutocompleteViewController();

    var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();

    override func viewDidLoad() {
        super.viewDidLoad()

        acController.delegate = self

        if (defaults.arrayForKey(CityTableViewController.userDefaultsFavoritesKey) == nil) {
            defaults.setValue(NSArray(), forKey: CityTableViewController.userDefaultsFavoritesKey)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)

        favoriteTableView.reloadData()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cityData.count)
    }

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
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            cityData.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //        sender
        if segue.identifier == "cityDetailIdentifier" {

            let indexPath = tableView.indexPathForSelectedRow!
            let currentCity = cityData[indexPath.row]

            let d = segue.destinationViewController as! CityDetailViewController
            d.cityData = currentCity
        }
    }

    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        presentViewController(acController, animated: true, completion: nil)
    }


    func viewController(viewController: GMSAutocompleteViewController!, didAutocompleteWithPlace place: GMSPlace!) {
        dismissFullScreenAutocompleteWidget()
        JsonHelper.requestCurCityDataByLocation(place.coordinate.latitude, lon: place.coordinate.longitude, callback: {
            cd in
            self.cityData.append(cd)
            self.favoriteTableView.reloadData()
        })
    }

    func viewController(viewController: GMSAutocompleteViewController!, didFailAutocompleteWithError error: NSError!) {
        dismissFullScreenAutocompleteWidget()
    }

    func wasCancelled(viewController: GMSAutocompleteViewController!) {
        dismissFullScreenAutocompleteWidget()
    }

    private func dismissFullScreenAutocompleteWidget() {
        if (self.presentedViewController != nil) {
            self.dismissViewControllerAnimated(true, completion: nil)
        } else if (self.navigationController?.topViewController?.isKindOfClass(GMSAutocompleteViewController) == true) {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
