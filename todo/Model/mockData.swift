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
            mockTaskModels.append(taskModel(title: "check email"))
        }
        mockTaskModels.append(taskModel(title: "call meatball"))
        mockTaskModels.append(taskModel(title: "buy eggs", subtaskModels: createMockSubtaskModelsData()))
        return mockTaskModels
    }
    static func createMockSubtaskModelsData() -> [subtaskModel] {
        var mockSubtaskModels = [subtaskModel]()
        mockSubtaskModels.append(subtaskModel(title: "bring money"))
        mockSubtaskModels.append(subtaskModel(title: "bring key"))
        return mockSubtaskModels
    }
}
