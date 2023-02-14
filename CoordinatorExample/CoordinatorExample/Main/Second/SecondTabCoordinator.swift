//
//  SecondTabCoordinator.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import UIKit
class SecondTabCoordinator: Coordinator {
    var rootViewConroller = UINavigationController()
    
    lazy var secondViewController = {
       let viewController = SecondViewController()
        viewController.title = "Second"
        return viewController
    }()
    func start() {
        rootViewConroller.setViewControllers([secondViewController], animated: false)
    }
}
