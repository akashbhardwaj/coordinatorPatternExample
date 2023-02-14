//
//  MainCoordinator.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import UIKit
class MainCoordinator: Coordinator {
    var rootViewController: UITabBarController
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }
    var childCoordinator = [Coordinator]()
    func start() {
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        let firstViewController = firstCoordinator.rootViewController
        setup(firstViewController, title: "First", image: "bell", selectedImage: "bell.fill")
        childCoordinator.append(firstCoordinator)
        
        let secondTabCoordinator = SecondTabCoordinator()
        secondTabCoordinator.start()
        let secondVc = secondTabCoordinator.rootViewConroller
        setup(secondVc, title: "Second", image: "paperplane", selectedImage: "paperplane.fill")
        childCoordinator.append(secondTabCoordinator)
        
        rootViewController.viewControllers = [firstViewController, secondTabCoordinator.rootViewConroller]
    }
    
    func setup(_ vc: UIViewController, title: String, image: String, selectedImage: String) {
        vc.tabBarItem = UITabBarItem(title: title,
                                     image: UIImage(systemName: image),
                                     selectedImage: UIImage(systemName: selectedImage))
    }
}
