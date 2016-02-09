//
//  WeatherData.swift
//  iOSProgrammingApp
//
//  Created by Julius on 21.12.15.
//  Copyright © 2015 Hackel & Keller. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Condition {
    let id: Int?;
    let main: String?;
    let desc: String?;
    let icon: String?;

    public static func parseFromJSON(json: JSON) -> Condition? {
        if let json:JSON = json[0] {
            return Condition(
                id: json["id"].int,
                main: json["main"].string,
                desc: json["description"].string,
                icon: json["icon"].string);
        }
        return nil;
    }
}

struct Temperature {
    let temp: Float?;
    let maxTemp: Float?;
    let minTemp: Float?;

    public static func parseFromJSON(json: JSON) -> Temperature {
        return Temperature(temp: json["temp"].float, maxTemp: json["temp_max"].float, minTemp: json["temp_min"].float)
    }


}

struct Wind {
    let speed: Float?;
    let deg: Float?;

    public static func parseFromJSON(json: JSON) -> Wind {
        return Wind(speed: json["speed"].float, deg: json["deg"].float)
    }
}

class WeatherData {
    let date: NSDate
    let temperature: Temperature?
    let condition: Condition?
    let wind: Wind?
    let humidity: Float?
    let cloudiness: Float?
    let rain: Float?
    let snow: Float?

    init (date: NSDate, temperature: Temperature? = nil, condition: Condition? = nil, wind: Wind? = nil,
          humidity: Float? = nil, cloudiness: Float? = nil, rain: Float? = nil, snow: Float? = nil) {
        self.date = date;
        self.temperature = temperature;
        self.condition = condition;
        self.wind = wind;
        self.humidity = humidity;
        self.cloudiness = cloudiness;
        self.rain = rain;
        self.snow = snow;
    }

    public static func parseFromJSON(json: JSON) -> WeatherData {
        return WeatherData(
            date: NSDate(timeIntervalSince1970: json["dt"].doubleValue),
            temperature: Temperature.parseFromJSON(json["main"]),
            condition: Condition.parseFromJSON(json["weather"]),
            wind: Wind.parseFromJSON(json["wind"]),
            humidity: json["main"]["humidity"].float,
            cloudiness: json["clouds"]["all"].float,
            rain: json["rain"]["3h"].float,
            snow: json["snow"]["3h"].float
        )
    }

//    func setCurrentTemperature(temperature: Float) {
//        currentTemperature = temperature
//    }
//
//    func setWeatherCondition(condition: conditionType) {
//        self.condition = condition
//    }
//
//    func setWindCondition(wind: Float) {
//        self.wind = wind
//    }
//
//    func setHumidity(humidity: Float) {
//        self.humidity = humidity
//    }
}