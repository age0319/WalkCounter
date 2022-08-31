//
//  DateExtension.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/17.
//

import Foundation

extension Date
{
    mutating func addDays(n: Int)
    {
        let cal = Calendar.current
        self = cal.date(byAdding: .day, value: n, to: self)!
    }
    
    func firstDayOfTheMonth() -> Date {
        return Calendar.current.date(from:
                                        Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    func firstDayOfthisYear() -> Date {
        return Calendar.current.date(from:
            Calendar.current.dateComponents([.year], from: self))!
    }
    
    func getAllDays() -> [Date]
    {
        var days = [Date]()
        
        let calendar = Calendar.current
        
        let range = calendar.range(of: .day, in: .month, for: self)!
        
        var day = firstDayOfTheMonth()
        
        for _ in 1...range.count
        {
            days.append(day)
            day.addDays(n: 1)
        }
        
        return days
    }
        
    func getWeekDay() -> Int {
        return Calendar.current.component(.weekday, from: self) - 1
    }
    
    func changeMonth(i:Int) -> Date {
        return Calendar.current.date(byAdding: DateComponents(month:i), to: Date())!
    }
    
    func DateToStringFormatter(format:String) -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.timeZone = TimeZone.current
        df.dateFormat = format
        
        return df.string(from: self)
    }
    
}
