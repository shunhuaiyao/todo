//
//  DateExtension.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/7/2.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

extension Date {
    func add(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    func add(hours: Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: hours, to: Date())!
    }
}
