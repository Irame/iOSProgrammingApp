//
// Created by student on 21.01.16.
// Copyright (c) 2016 Hackel & Keller. All rights reserved.
//

import Foundation

extension NSDate {
    func formattedStringForDate(format: String) -> String {
        let formatter = NSDateFormatter()
        let locale = NSLocale.currentLocale();

        formatter.locale = locale
        formatter.dateFormat = format

        return formatter.stringFromDate(self)
    }
}