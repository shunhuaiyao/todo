//
//  DateCell.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/10.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import JTAppleCalendar

class DateCell: JTACDayCell {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var selectedView: UIView!
}
