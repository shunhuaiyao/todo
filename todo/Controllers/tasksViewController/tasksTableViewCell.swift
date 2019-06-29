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
    @IBOutlet weak var checkButtonOutlet: UIButton!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var checkedLineOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.taskView.layer.shadowOpacity = 0.5
        self.taskView.layer.shadowOffset = CGSize.zero
        self.taskView.layer.shadowColor = UIColor.lightGray.cgColor
//        self.taskView.layer.cornerRadius = 10
        self.taskView.backgroundColor = Theme.accentColor
        self.checkButtonOutlet.setImage(UIImage(named: "uncheckedButton.png"), for: .normal)
        self.checkButtonOutlet.setImage(UIImage(named: "checkedButton.png"), for: .highlighted)
        self.checkButtonOutlet.setImage(UIImage(named: "checkedButton.png"), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(taskModel: taskModel) {
        self.taskTitleLabel.text = taskModel.title
    }
    @IBAction func checkButton(_ sender: Any) {
        self.checkButtonOutlet.isSelected = !self.checkButtonOutlet.isSelected
        if self.checkButtonOutlet.isSelected {
            self.taskTitleLabel.textColor = UIColor.lightGray
            self.timeLabel.textColor = UIColor.lightGray
            UIView.animate(withDuration: 0.2) {
                self.checkedLineOutlet.alpha = 1
            }
        } else {
            self.taskTitleLabel.textColor = Theme.taskLabelColor
            self.timeLabel.textColor = Theme.taskLabelColor
            UIView.animate(withDuration: 0.2) {
                self.checkedLineOutlet.alpha = 0
            }
        }
        
    }
}
