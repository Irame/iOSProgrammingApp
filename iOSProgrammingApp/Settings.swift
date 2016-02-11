//
// Created by student on 09.02.16.
// Copyright (c) 2016 Hackel & Keller. All rights reserved.
//

import Foundation

class Settings {
    private static let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();

    private static let tempUnitKey:String = "tempUnit"
    private static let userDefaultsFavoritesKey:String = "favorites"

    private init() {}

    internal static func saveTempUnitIndex(tempUnitIndex:Int) {
        defaults.setValue(tempUnitIndex, forKey: tempUnitKey)
    }

    internal static func loadTempUnitIndex() -> Int {
        return defaults.integerForKey(tempUnitKey)
    }

    internal static func loadFavorites(callback:(CityData) -> ()) {
        let favs = defaults.arrayForKey(userDefaultsFavoritesKey) as! [NSNumber]?;
        if let favs = favs {
            for id in favs {
                JsonHelper.requestCurCityDataById(Int(id), callback: callback)
            }
        }
    }

    internal static func saveFavorites(cityData:[CityData]) {
        let nsArray = NSArray(array: cityData.flatMap({cd in cd.id != nil ? NSNumber(long: cd.id!) : nil}));
        defaults.setValue(nsArray, forKey: userDefaultsFavoritesKey)
    }

    private static func getValueAsEnum<E: RawRepresentable where E.RawValue == String>(forKey key:String, withDefault defaultValue:E) -> E {
        let enumString = defaults.stringForKey(key)
        var result:E? = nil
        if let enumString = enumString {
            result = E(rawValue: enumString)
        }
        return result != nil ? result! : defaultValue
    }
}