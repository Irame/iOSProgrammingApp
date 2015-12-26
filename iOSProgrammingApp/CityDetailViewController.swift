//
//  CityDetailViewController.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var city : CityData!
    
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
        
        cityNameLbl.text = city.name
        countryLbl.text = city.country
        temperatureLbl.text = String(city.currentWeather?.currentTemperature)
        weatherConditionLbl.text = String(city.currentWeather?.condition)
        windLbl.text = String(city.currentWeather?.wind)
        humidityLbl.text = String(city.currentWeather?.humidity)
        dateLbl.text = city.currentWeather?.date
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (city.forecastWeather?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //get Cell with the Identifier from Storyboard!!
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailForecastIdentifier") as! CityDetailForecastCell
        //indexPath.section
        
        print("\(indexPath.section) -  \(indexPath.row)")
        let forecast = city.forecastWeather![indexPath.row]
        cell.configureCellForForecast(forecast)
        
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
            students.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            print("nichts machen")
        }
        //tableView.endUpdates()
    }*/

  }