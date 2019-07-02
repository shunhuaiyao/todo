//
//  dayModel.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/24.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

struct dayModel {
    var id: UUID
    var date: Date
    var dateString: String
    var weekString: String
    var taskModels = [taskModel]()
    
    init(date: Date, taskModels: [taskModel]? = nil) {
        self.id = UUID()
        self.date = date
        
        let formatter = DateFormatter()
        formatter.dateFormat = " MMM dd"
        self.dateString = formatter.string(from: date)
        formatter.dateFormat = "E"
        self.weekString = formatter.string(from: date)
        
        if let taskModels = taskModels {
            self.taskModels = taskModels
        }
    }
}

extension dayModel: Comparable {
    static func < (lhs: dayModel, rhs: dayModel) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func == (lhs: dayModel, rhs: dayModel) -> Bool {
        return lhs.id == rhs.id
    }
}
