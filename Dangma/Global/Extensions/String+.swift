//
//  String.swift
//  Dangma
//
//  Created by soyounglee on 2020/12/06.
//

import Foundation

extension String {
    public func getDateFormat(time: String) -> Date? {
        let timeSplit = time.components(separatedBy: ["T", "."])
        let timeFormatted = timeSplit[0] + " " + timeSplit[1]
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YY-MM-dd HH:mm:ss"
        
        let timeDateFormat = dateFormat.date(from: timeFormatted)
        
        return timeDateFormat
    }

}
