//
//  TabBarController.swift
//  TableViewTask
//
//  Created by Александра Кострова on 14.08.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    private lazy var taskOne = TaskOneViewController()
    private lazy var taskTwo = TaskTwoViewController()
    private lazy var taskThree = TaskThreeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewControllers()
        tabBarConfig()
    }
    
    private func tabBarConfig() {
        view.backgroundColor = .systemBackground
        
        // Set TabBar to last position
        selectedIndex = 2
    }
    
    private func addViewControllers() {
        viewControllers = [
            generateTabBarItems(taskOne, taskNumber: 1),
            generateTabBarItems(taskTwo, taskNumber: 2),
            generateTabBarItems(taskThree, taskNumber: 3)
        ]
    }
    
    private func generateTabBarItems(_ viewController: UIViewController, taskNumber: Int) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.tabBarItem.image = Constants.Images.folder
        navigationVC.tabBarItem.title = "Task \(taskNumber)"
        return navigationVC
    }
}
