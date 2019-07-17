//
//  SecondViewController.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/9.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class statsViewComtroller: UIViewController {

    @IBOutlet weak var basePieChartView: BasePieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        basePieChartView.play()
    }

}

