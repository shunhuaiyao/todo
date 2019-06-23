//
//  taskFunctions.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/21.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation

class taskFunctions {
    static func createTask(taskModel: taskModel) {
        Data.taskModels.append(taskModel)
    }
    
    static func readTasks(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.taskModels.count == 0 {
                Data.taskModels.append(taskModel(title: "check email"))
                Data.taskModels.append(taskModel(title: "call meatball"))
                Data.taskModels.append(taskModel(title: "buy eggs"))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func updateTask(at index: Int, title: String) {
        Data.taskModels[index].title = title
//        Data.taskModels[index].startTime = startTime
//        Data.taskModels[index].endTime = endTime
    }
    
    static func deleteTask(index: Int) {
        Data.taskModels.remove(at: index)
    }
}
