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
        
    }
    
    static func readTasks(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.taskModels.count == 0 {
                Data.taskModels.append(taskModel(title: "check email"))
                Data.taskModels.append(taskModel(title: "call meatball"))
                Data.taskModels.append(taskModel(title: "buy eggs"))
            }
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func updateTask(taskModel: taskModel) {
        
    }
    
    static func deleteTask(taskModel: taskModel) {
        
    }
}
