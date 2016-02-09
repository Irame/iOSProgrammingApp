//
// Created by student on 21.01.16.
// Copyright (c) 2016 Hackel & Keller. All rights reserved.
//

import Foundation

class Utils {
    public static func setValueOrDefault(inout variableToSet: String?, valueToSet: String?, defaultValue: String) {
        if let value = valueToSet {
            variableToSet = value
        } else {
            variableToSet = defaultValue;
        }
    }

    public static func setValueOrDefault(inout variableToSet: String?, valueToSet: Float?, defaultValue: String) {
        if let value = valueToSet {
            variableToSet = String(format: "%.1f", value)
        } else {
            variableToSet = defaultValue;
        }
    }

    public static func setValueOrDefault(inout variableToSet: String?, valueToSet: NSDate?, defaultValue: String) {
        if let value = valueToSet {
            variableToSet = value.formattedStringForDate("dd.MM")
        } else {
            variableToSet = defaultValue;
        }
    }
}