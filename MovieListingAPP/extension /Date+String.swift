//
//  Date+String.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/04.
//

import Foundation
import UIKit

extension Date {
    func date(fromString dateString: String) -> Date {
        func getDate() -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: dateString)
        }
        return Date()
    }
    
    func getYearOnDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
}
