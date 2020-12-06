//
//  Date+.swift
//  Dangma
//
//  Created by soyounglee on 2020/12/06.
//

import Foundation

extension String {
    
    func timeAgoSince(_ date: Date) -> String {
        
        let calendar = Calendar.current
        let now = Date() // 서버시간이 9시간 밀려서 뺌
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: date, to: now, options: [])
        
        if let year = components.year, year >= 1 {
            return "\(year)년 전"
        }
        
        if let month = components.month, month >= 2 {
            return "\(month)달 전"
        }
        
        if let week = components.weekOfYear, week >= 2 {
            return "\(week)주 전"
        }
        
        // 남은 일수 계산
        if let day = components.day, day >= 2{
            let remain = day
            return "\(remain)일 전"
        }
        
        if let hour = components.hour {
            let remain = hour
            return "\(remain)시간 전"
        }
        
        return "지금"
        
    }


    
}
