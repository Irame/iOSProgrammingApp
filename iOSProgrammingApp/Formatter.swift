//
// Created by student on 09.02.16.
// Copyright (c) 2016 Hackel & Keller. All rights reserved.
//

import Foundation

class Formatter {
    private static let tempUnitShort:[String] = ["°C", "°F", "°K"]
    private static let tempUnitTransform:[(Float)->(Float)] = [
    {t in t - 273.15},
    {t in t * 9 / 5 - 459.67},
    {t in t}]

    private static let notAvalableText = "N/A"

    internal static func formatTemp(temp:Float?) -> String {
        if let temp = temp {
            let unitIndex = Settings.loadTempUnitIndex();
            return String(format: "%.1f \(tempUnitShort[unitIndex])", tempUnitTransform[unitIndex](temp))
        } else {
            return notAvalableText
        }
    }

    internal static func formatHumidity(humidity:Float?) -> String {
        if let humidity = humidity {
            return String(format: "%.0f%%", humidity)
        } else {
            return notAvalableText
        }
    }

    internal static func formatWind(wind:Float?) -> String {
        if let wind = wind {
            return String(format: "%.1f m/s", wind)
        } else {
            return notAvalableText
        }
    }

    internal static func formatDate(date:NSDate?) -> String {
        if let date = date {
            return date.formattedStringForDate("dd/MM H:mm")
        } else {
            return notAvalableText
        }
    }

    internal static func formatString(s:String?) -> String {
        if let s = s {
            return s
        } else {
            return notAvalableText
        }
    }
}
