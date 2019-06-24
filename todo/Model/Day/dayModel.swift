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
    var taskModels = [taskModel]()
    
    init(date: Date, taskModels: [taskModel]? = nil) {
        self.id = UUID()
        self.date = date
        
        let formatter = DateFormatter()
        formatter.dateFormat = " MMMM dd"
        self.dateString = formatter.string(from: date)
        
        if let taskModels = taskModels {
            self.taskModels = taskModels
        }
    }

}
