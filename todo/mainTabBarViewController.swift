//
//  mainTabBarViewController.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/12.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

class mainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let vc = mainStoryboard.instantiateViewController(withIdentifier: "addTasksViewController") as? addTasksViewController
            {
                self.present(vc, animated: true, completion: nil)
            }
            return false
        } else {
            return true
        }
    }
}
