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

extension String {

    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }

    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start: start, end: end)]
    }
}