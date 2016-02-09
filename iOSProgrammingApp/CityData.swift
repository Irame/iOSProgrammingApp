//
//  CityData.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import Foundation


class CityData {
    let id: Int?
    let name: String?
    let country: String?
    var currentWeather: WeatherData?
    var forecastWeather: [WeatherData]? = []

    init(id: Int?, name: String?, country: String?) {
        self.id = id
        self.name = name
        self.country = country
    }

    func setCurrentWeather(weather: WeatherData) {
        currentWeather = weather
    }
    
    func setForecastWeather(weatherArray : [WeatherData])
    {
        forecastWeather = weatherArray
    }

    func addForecastedWeather(weather: WeatherData) {
        if var forecastWeather = forecastWeather {
            forecastWeather.insert(weather, atIndex: (self.forecastWeather?.endIndex)!)
        }
    }
}