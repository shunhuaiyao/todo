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
            self.performSegue(withIdentifier: "toAddTasksViewController", sender: nil)
            return false
        } else {
            return true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTasksViewController" {
            let mainTabBarViewController = segue.source as! mainTabBarViewController
            let tasksViewController = mainTabBarViewController.viewControllers?[0] as! FirstViewController
            let popup = segue.destination as! addTasksViewController
            popup.doneAddingTask = { [unowned tasksViewController = tasksViewController] in
                tasksViewController.todoTasksTableView.reloadData()
            }
        }
    }
}
