//
//  AppRouter.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import Foundation
import Observation

enum AppState: Equatable {
    case splash
    case onboarding
    case home
}

@MainActor
@Observable
final class AppRouter {
    private(set) var currentState: AppState = .splash

    func handleSplashCompleted(hasSeenOnboarding: Bool) {
        currentState = hasSeenOnboarding ? .home : .onboarding
    }

    func handleOnboardingCompleted() {
        currentState = .home
    }
}
