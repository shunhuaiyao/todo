//
//  subtaskModel.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/24.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

struct subtaskModel {
    var id: UUID
    var title: String
    var check: Bool
    var startTime: Date?
    var endTime: Date?
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.check = false
    }
}
