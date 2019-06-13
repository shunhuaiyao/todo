//
//  addTasksViewController.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/12.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import Presentr

class addTasksViewController: UIViewController {

    var dateTimePicker: UIDatePicker!
    
    let presenter: Presentr = {
        let width = ModalSize.full
        let height = ModalSize.custom(size: 266)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height - 266))
        let customType = PresentationType.custom(width: width, height: height, center: center)
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverHorizontalFromLeft
        customPresenter.transitionType = .crossDissolve
        customPresenter.dismissAnimated = true
        return customPresenter
    }()
    
    @IBAction func backToTabBarViewButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startTimeButton(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = mainStoryboard.instantiateViewController(withIdentifier: "datePickerViewController") as? datePickerViewController
        {
            customPresentViewController(self.presenter, viewController: vc, animated: true, completion: nil)
        }
    }
    @IBAction func endTimeButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
