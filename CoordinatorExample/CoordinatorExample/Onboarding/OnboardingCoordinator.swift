//
//  OnboardingCoordinator.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import UIKit
import SwiftUI
import Combine
class OnboardingCoordinator: Coordinator {
    var rootViewController = UIViewController()
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        let viewController = UIHostingController(rootView: view)
        rootViewController = viewController
    }
}
