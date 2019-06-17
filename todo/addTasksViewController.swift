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

    @IBOutlet weak var startTimeOutlet: PMSuperButton!
    @IBOutlet weak var endTimeOutlet: PMSuperButton!
    
    @IBAction func backToTabBarViewButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startTimeButton(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = mainStoryboard.instantiateViewController(withIdentifier: "datePickerViewController") as? datePickerViewController {
            vc.onSetDateTime = { (dateTime:String) -> () in
                self.startTimeOutlet.setTitle(dateTime, for: .normal)
            }
            self.present(vc, animated: false, completion: nil)
        }
    }
    @IBAction func endTimeButton(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = mainStoryboard.instantiateViewController(withIdentifier: "datePickerViewController") as? datePickerViewController {
            vc.onSetDateTime = { (dateTime:String) -> () in
                self.endTimeOutlet.setTitle(dateTime, for: .normal)
            }
            self.present(vc, animated: false, completion: nil)
        }
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
    }
    
    
}
