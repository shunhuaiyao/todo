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

    @IBOutlet weak var addTagOutlet: UIButton!
    @IBOutlet weak var startTimeOutlet: UIButton!
    @IBOutlet weak var endTimeOutlet: UIButton!
    @IBOutlet weak var addSubtaskOutlet: UIButton!
    @IBOutlet weak var addNoteOutlet: UIButton!
    
    @IBAction func backToTabBarViewButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTodoButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let dateTime = " " + formatter.string(from: Date())
        self.startTimeOutlet.setTitle(dateTime, for: .normal)
        self.endTimeOutlet.setTitle(dateTime, for: .normal)
        
        self.startTimeOutlet.createShadowandBorder()
        self.endTimeOutlet.createShadowandBorder()
        self.addTagOutlet.createDashedBorder(cornerRadius: self.addTagOutlet.frame.height / 2)
        self.addSubtaskOutlet.createDashedBorder(cornerRadius: self.addSubtaskOutlet.frame.height / 2)
        self.addNoteOutlet.createDashedBorder(cornerRadius: 5)
        
        
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
    
    
}
