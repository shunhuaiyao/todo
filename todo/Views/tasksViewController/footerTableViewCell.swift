//
//  footerTableViewCell.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/25.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class footerTableViewCell: UITableViewCell {

    @IBOutlet weak var footerContentView: UIView!
    @IBOutlet weak var footerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setup() {
        self.footerView.layer.cornerRadius = 25
        self.footerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.footerView.layer.shadowOpacity = 0.75
        self.footerView.layer.shadowOffset = CGSize.zero
        self.footerView.layer.shadowColor = UIColor.lightGray.cgColor
    }
}
