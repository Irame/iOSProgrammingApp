//
// Created by student on 19.01.16.
// Copyright (c) 2016 Hackel & Keller. All rights reserved.
//

import Foundation
import SwiftyJSON

class JsonHelper {
    static private let APIID = "appid=2482edba832603f1ca110ad5df45f071";

    static private let apiRequestURL:NSURL = NSURL(string: "http://api.openweathermap.org/data/2.5/")!

    static private let curDayKey = "weather";
    static private let fiveDayForecast = "forecast";

    public static func requestCurCityDataByLocation(lat: Double, lon: Double, callback: (CityData) -> Void) {
        let url = buildURL(curDayKey, "lat=\(lat)", "lon=\(lon)")

        requestJSON(url,
                jsonConverter: { json -> CityData in
                    let cityData = CityData(id: json["id"].int, name: json["name"].string, country: json["sys"]["country"].string)
                    cityData.setCurrentWeather(WeatherData.parseFromJSON(json))
                    return cityData
                },
                callback: callback)
    }
    
    public static func requestForecastCityDataByLocation(curCity : CityData, callback: () -> Void) {
        let url = buildURL(fiveDayForecast, "q=\(curCity.name)")
        
        requestJSON(url,
            jsonConverter: { json in
                var weatherData : [WeatherData] = []
                if let jsonWeatherArray = json["list"].array{
                    for weatherJson in jsonWeatherArray {
                        weatherData.append(WeatherData.parseFromJSON(weatherJson))
                    }
                    curCity.setForecastWeather(weatherData)
                }
            },
            callback: callback)
    }

    private static func buildURL(subDir: String, _ queryArgs: String...) -> NSURL {
        if let urlComponents = NSURLComponents(URL: apiRequestURL.URLByAppendingPathComponent(subDir), resolvingAgainstBaseURL: false) {
            urlComponents.query = APIID

            for queryArg: String in queryArgs {
                urlComponents.query? += "&" + queryArg
            }

            return urlComponents.URL!;
        }
        return NSURL()
    }

    private static func requestJSON<T>(url: NSURL, jsonConverter: (JSON) -> T, callback: (T) -> Void) {
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            (data, response, error) in
            if let error = error {
                return;
            }

            if let data = data {
                let json = JSON(data: data)
                callback(jsonConverter(json))
            }
        }).resume()
    }
}
