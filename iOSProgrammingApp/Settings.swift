//
// Created by student on 09.02.16.
// Copyright (c) 2016 Hackel & Keller. All rights reserved.
//

import Foundation

class Settings {
    private static let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();

    private static let tempUnitKey:String = "tempUnit"

    private init() {}

    public static func saveTempUnitIndex(tempUnitIndex:Int) {
        defaults.setValue(tempUnitIndex, forKey: tempUnitKey)
    }

    public static func loadTempUnitIndex() -> Int {
        return defaults.integerForKey(tempUnitKey)
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