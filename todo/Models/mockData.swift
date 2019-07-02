//
//  mockData.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/24.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

class mockData {
    static func createMockDayModelsData() -> [dayModel] {
        var mockDayModels = [dayModel]()
        mockDayModels.append(dayModel(date: Date(), taskModels: createMockTaskModelsData(numTasks: 3)))
        mockDayModels.append(dayModel(date: Date().addingTimeInterval(86400), taskModels: createMockTaskModelsData(numTasks: 2)))
        return mockDayModels
    }
    static func createMockTaskModelsData(numTasks: Int) -> [taskModel] {
        var mockTaskModels = [taskModel]()
        if numTasks == 3 {
            mockTaskModels.append(taskModel(title: "check email", startTime: Date().add(hours: 8), endTime: Date().add(hours: 9)))
            mockTaskModels.append(taskModel(title: "update addTasks UI", startTime: Date().add(hours: 10), endTime: Date().add(hours: 11)))
            mockTaskModels.append(taskModel(title: "buy eggs", startTime: Date().add(hours: 11), endTime: Date().add(hours: 12), subtaskModels: createMockSubtaskModelsData()))
        } else {
            mockTaskModels.append(taskModel(title: "check email", startTime: Date().add(days: 1).add(hours: 8), endTime: Date().add(days: 1).add(hours: 9)))
            mockTaskModels.append(taskModel(title: "make meatballs", startTime: Date().add(days: 1).add(hours: 12), endTime: Date().add(days: 1).add(hours: 13)))
        }
        
        return mockTaskModels
    }
    static func createMockSubtaskModelsData() -> [subtaskModel] {
        var mockSubtaskModels = [subtaskModel]()
        mockSubtaskModels.append(subtaskModel(title: "bring money"))
        mockSubtaskModels.append(subtaskModel(title: "bring key"))
        return mockSubtaskModels
    }
}
