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

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        cityNameLbl.text = Formatter.formatString(cityData.name)
        countryLbl.text = Formatter.formatString(cityData.flag);
        temperatureLbl.text = Formatter.formatTemp(cityData.currentWeather?.temperature?.temp)
        weatherConditionLbl.text = Formatter.formatString(cityData.currentWeather?.condition?.main);
        windLbl.text = Formatter.formatWind(cityData.currentWeather?.wind?.speed);
        humidityLbl.text = Formatter.formatHumidity(cityData.currentWeather?.humidity);
        dateLbl.text = Formatter.formatDate(cityData.currentWeather?.date);
        weatherImage.image = UIImage(named: (cityData.currentWeather?.condition?.icon)!)

        JsonHelper.requestForecastDataByCity(cityData, callback: self.forecastTableView.reloadData)
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