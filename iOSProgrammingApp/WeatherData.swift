//
//  WeatherData.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import Foundation

enum conditionType : String {
    case couldy = "cloudy"
    case windy = "windy"
    case sunny = "sunny"
    case notSet = "notSet"
}


class WeatherData {
    
    var date : String = "no date"
    var currentTemperature : Float = 0.0
    var condition = conditionType.notSet
    var wind : Float = 0.0
    var humidity : Float = 0.0
    
    func setCurrentTemperature(temperature : Float) {
        currentTemperature = temperature
    }
    
    func setWeatherCondition(condition : conditionType) {
        self.condition = condition
    }
    
    func setWindCondition(wind : Float){
        self.wind = wind
    }
    
    func setHumidity(humidity : Float){
        self.humidity = humidity
    }
}