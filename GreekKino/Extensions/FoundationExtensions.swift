//
//  FoundationExtensions.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/20/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation


//MARK: Date
//test
extension Date {
    func convertToTimeString () -> String {
        let dateFormatterToTime = DateFormatter()
        dateFormatterToTime.dateFormat = "HH:mm"
        return dateFormatterToTime.string(from: self)
    }
}
extension Date {
    func currentTimeMillis() -> Int {
        return Int(self.timeIntervalSince1970 * 1000)
    }
}

