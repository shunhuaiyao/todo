//
//  addTasksViewController.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/12.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import Presentr
import PMSuperButton

class addTasksViewController: UIViewController {

    @IBOutlet weak var addTodoOutlet: UIButton!
    @IBOutlet weak var taskTitleOutlet: UITextField!
    @IBOutlet weak var addTagOutlet: UIButton!
    @IBOutlet weak var startTimeOutlet: UIButton!
    @IBOutlet weak var endTimeOutlet: UIButton!
    @IBOutlet weak var addSubtaskOutlet: UIButton!
    @IBOutlet weak var addNoteOutlet: UIButton!
    
    var doneAddingTask: (() -> ())?
    var taskIndexPathToEdit: IndexPath?
    
    @IBAction func backToTabBarViewButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTodoButton(_ sender: Any) {
        
        if let indexPath = taskIndexPathToEdit {
//            taskFunctions.updateTask(at: index, title: self.taskTitleOutlet.text ?? Data.taskModels[index].title)
            dayFunctions.updateDay(at: indexPath, title: self.taskTitleOutlet.text ?? Data.dayModels[indexPath.section].taskModels[indexPath.row].title)
            
        } else {
            if let dayIndex = dayAlreadyExists(Date()) {
                dayFunctions.createTaskInExistedDay(at: dayIndex, taskModel: taskModel(title: taskTitleOutlet.text!))
            } else {
                var taskModels = [taskModel]()
                taskModels.append(taskModel(title: taskTitleOutlet.text!))
                dayFunctions.createDay(dayModel: dayModel(date: Date(), taskModels: taskModels))
            }
        }
        if let doneAddingTask = doneAddingTask {
            doneAddingTask()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        var dateTime = " " + formatter.string(from: Date())
        self.startTimeOutlet.setTitle(dateTime, for: .normal)
        self.endTimeOutlet.setTitle(dateTime, for: .normal)
        
        self.startTimeOutlet.createShadowandBorder()
        self.endTimeOutlet.createShadowandBorder()
        self.addTagOutlet.createDashedBorder(cornerRadius: self.addTagOutlet.frame.height / 2)
        self.addSubtaskOutlet.createDashedBorder(cornerRadius: self.addSubtaskOutlet.frame.height / 2)
        self.addNoteOutlet.createDashedBorder(cornerRadius: 5)
        
        if let indexPath = taskIndexPathToEdit {
            self.addTodoOutlet.setTitle("Save", for: .normal)
            let task = Data.dayModels[indexPath.section].taskModels[indexPath.row]
            self.taskTitleOutlet.text = task.title
            dateTime = " " + formatter.string(from: task.startTime ?? Date())
            self.startTimeOutlet.setTitle(dateTime, for: .normal)
            dateTime = " " + formatter.string(from: task.endTime ?? Date())
            self.endTimeOutlet.setTitle(dateTime, for: .normal)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startTimetoDatePickerViewControllerSegue" {
            let popup = segue.destination as! datePickerViewController
            popup.onSetDateTime = { [unowned self] (dateTime:String) -> () in
                self.startTimeOutlet.setTitle(dateTime, for: .normal)
            }
        }
        else if segue.identifier == "endTimetoDatePickerViewControllerSegue" {
            let popup = segue.destination as! datePickerViewController
            popup.onSetDateTime = { [unowned self] (dateTime:String) -> () in
                self.endTimeOutlet.setTitle(dateTime, for: .normal)
            }
        }
    }
    
    deinit {
        print("addTasksViewController deinit")
    }
    
    func dayAlreadyExists(_ date: Date) -> Int? {
        let formatter = DateFormatter()
        formatter.dateFormat = " MMMM dd"
        let dateString = formatter.string(from: date)
        
        for (index, dayModel) in Data.dayModels.enumerated() {
            if dayModel.dateString == dateString {
                return index
            }
        }
        return nil
    }
}
