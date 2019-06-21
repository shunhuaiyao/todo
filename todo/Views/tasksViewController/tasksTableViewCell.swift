//
//  tasksTableViewCell.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/21.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class tasksTableViewCell: UITableViewCell {

    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var taskTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.taskView.layer.shadowOpacity = 1
        self.taskView.layer.shadowOffset = CGSize.zero
        self.taskView.layer.shadowColor = UIColor.darkGray.cgColor
        self.taskView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(taskModel: taskModel) {
        self.taskTitleLabel.text = taskModel.title
    }
}
