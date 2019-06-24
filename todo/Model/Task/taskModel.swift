//
//  taskModel.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/21.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

struct taskModel{
    var id: UUID
    var title: String
    var check: Bool
    var startTime: Date?
    var endTime: Date?
    var subtaskModels = [subtaskModel]()
    
    init(title: String, subtaskModels: [subtaskModel]? = nil) {
        self.id = UUID()
        self.title = title
        self.check = false
        if let subtaskModels = subtaskModels {
            self.subtaskModels = subtaskModels
        }
    }
}
