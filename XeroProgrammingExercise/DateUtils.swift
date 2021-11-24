//
//  DateUtils.swift
//  XeroProgrammingExercise
//
//  Created by Shireesh Marla on 24/11/2021.
//  Copyright © 2021 Xero Ltd. All rights reserved.
//

import Foundation

class DateUtils {
    
    public static func convertDateToDD_MM_YYYY(_ date : Date)-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        formatter.timeZone = TimeZone(abbreviation: "UTC")

        return formatter.string(from: date as Date)
    }
}
