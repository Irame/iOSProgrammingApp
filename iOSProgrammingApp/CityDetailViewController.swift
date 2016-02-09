//
//  CityDetailViewController.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cityData: CityData!

    @IBOutlet weak var forecastTableView: UITableView!
    
    @IBOutlet weak var cityNameLbl: UILabel!

    @IBOutlet weak var countryLbl: UILabel!

    @IBOutlet weak var temperatureLbl: UILabel!

    @IBOutlet weak var weatherConditionLbl: UILabel!

    @IBOutlet weak var windLbl: UILabel!

    @IBOutlet weak var humidityLbl: UILabel!

    @IBOutlet weak var weatherImage: UIImageView!

    @IBOutlet weak var dateLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        Utils.setValueOrDefault(&cityNameLbl.text, valueToSet: cityData.name, defaultValue: "N/A");
        Utils.setValueOrDefault(&countryLbl.text, valueToSet: cityData.country, defaultValue: "N/A");
        Utils.setValueOrDefault(&temperatureLbl.text, valueToSet: cityData.currentWeather?.temperature?.temp, defaultValue: "N/A");
        Utils.setValueOrDefault(&weatherConditionLbl.text, valueToSet: cityData.currentWeather?.condition?.main, defaultValue: "N/A");
        Utils.setValueOrDefault(&windLbl.text, valueToSet: cityData.currentWeather?.wind?.speed, defaultValue: "N/A");
        Utils.setValueOrDefault(&humidityLbl.text, valueToSet: cityData.currentWeather?.humidity, defaultValue: "N/A");
        Utils.setValueOrDefault(&dateLbl.text, valueToSet: cityData.currentWeather?.date, defaultValue: "N/A");
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        JsonHelper.requestForecastCityDataByLocation(cityData, callback: {cityData in //Closure for the win!
            dispatch_async(dispatch_get_main_queue()) { // 2
                  self.forecastTableView.reloadData() // 3
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cityData.forecastWeather?.count)!
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //get Cell with the Identifier from Storyboard!!
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailForecastIdentifier") as! CityDetailForecastCell
        //indexPath.section

        print("\(indexPath.section) -  \(indexPath.row)")
        let forecast = self.cityData.forecastWeather![indexPath.row]
        cell.configureCellForForecast(forecast)
        return cell
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

}