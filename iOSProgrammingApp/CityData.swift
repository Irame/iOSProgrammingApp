//
//  CityData.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import Foundation


class CityData {
    
    let name:String
    let country:String
    var currentWeather : WeatherData?
    var forecastWeather : [WeatherData]?
    
    init(name:String, country:String){
        self.name = name
        self.country = name
    }
    
    func setCurrentWeather(weather : WeatherData){
        currentWeather = weather
    }
    
    func addForecastedWeather(weather : WeatherData){
        if var forecastWeather = forecastWeather {
            forecastWeather.insert(weather, atIndex: (self.forecastWeather?.endIndex)!)
        }
    }
}