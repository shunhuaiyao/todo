//
//  datePickerViewController.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/13.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class datePickerViewController: UIViewController {
    
    var onSetDateTime: ((_ dateTime:String) -> ())?
    
    var formattedDateTime: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return " " + formatter.string(from: self.datePickerOutlet.date)
        }
    }
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func setDateButton(_ sender: Any) {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "setDateTime"), object: self)
        onSetDateTime?(formattedDateTime)
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func cancelDateButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
