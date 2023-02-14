//
//  FristTabCoordinator.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import UIKit
import SwiftUI
class FirstTabCoordinator: Coordinator {
    var rootViewController: UINavigationController
    
    let viewModel = FirstDetailViewModel()
    init() {
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    lazy var firstViewController = {
       let vc = FirstViewController()
        vc.firstDetailViewModel = viewModel
        vc.title = "First VC"
        vc.detailRequested = { [weak self] in
            self?.gotoDetail()
        }
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func gotoDetail() {
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}
