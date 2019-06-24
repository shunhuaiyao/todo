//
//  taskFunctions.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/21.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

class dayFunctions {
    
    static func createDay(dayModel: dayModel) {
        Data.dayModels.append(dayModel)
    }
    
    static func createTaskInExistedDay(at dayIndex: Int, taskModel: taskModel) {
        Data.dayModels[dayIndex].taskModels.append(taskModel)
    }
    
    static func readDays(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.dayModels.count == 0 {
                Data.dayModels = mockData.createMockDayModelsData()
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func updateDay(at indexPath: IndexPath, title: String) {
//        Data.taskModels[index].title = title
        Data.dayModels[indexPath.section].taskModels[indexPath.row].title = title
    }
    
    static func deleteTaskInExistedDay(indexPath: IndexPath) {
//        Data.taskModels.remove(at: index)
        Data.dayModels[indexPath.section].taskModels.remove(at: indexPath.row)
    }
}
