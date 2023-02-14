//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import UIKit
import SwiftUI
import Combine

class AppCoordinator: Coordinator {
    let window: UIWindow
    var childCoordinators: [Coordinator] = []
    
    var hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        setupOnboardingValue()
        
        hasSeenOnboarding
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeenOnbiarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnbiarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }
        .store(in: &subscriptions)

    }
    
    func setupOnboardingValue () {
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter({$0})
            .sink { value in
                UserDefaults.standard.set(value, forKey: key)
            }
            .store(in: &subscriptions)
    }
}
