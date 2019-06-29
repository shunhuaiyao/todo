//
//  daysTableViewCell.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/25.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class daysTableViewCell: UITableViewCell {

    @IBOutlet weak var dayContentView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setup(dayModel: dayModel) {
        
//        self.dayContentView.layer.cornerRadius = 25
//        self.dayContentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.dateLabel.text = dayModel.weekString + "," + dayModel.dateString
    }

}
