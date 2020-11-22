//
//  FoundationExtensions.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/20/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation


//MARK: Date
extension Date {
    func convertToTimeString () -> String {
        let dateFormatterToTime = DateFormatter()
        dateFormatterToTime.dateFormat = "HH:mm"
        return dateFormatterToTime.string(from: self)
    }
    func convertToTimeWithSecondsString() -> String {
        let dateFormatterToTime = DateFormatter()
        dateFormatterToTime.dateFormat = "HH:mm:ss"
        return dateFormatterToTime.string(from: self)
    }
    func currentTimeMillis() -> Int {
           return Int(self.timeIntervalSince1970 * 1000)
       }
}

