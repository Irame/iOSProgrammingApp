//
// Created by student on 21.01.16.
// Copyright (c) 2016 Hackel & Keller. All rights reserved.
//

import Foundation

class Utils {
    public static func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.append(UnicodeScalar(base + v.value))
        }
        return s
    }
}
