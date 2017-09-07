//
//  DateUtils.swift
//  task
//
//  Created by HASSAN RAZA on 07/09/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class DateUtils: NSObject {

    class func string(FromDate date:Date, format:String) -> String
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: date)
    }
    
    class func date(FromTimeInterval interval:TimeInterval) -> Date
    {
        return Date(timeIntervalSince1970: interval)
    }
    
    class func dateString(ForTimeInterval interval:TimeInterval, format:String) -> String
    {
        let date = self.date(FromTimeInterval: interval)
        return string(FromDate: date, format: format)
    }
}
