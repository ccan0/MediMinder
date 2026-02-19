//
//  SplashViewModel.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 19.02.2026.
//

import Foundation
import Observation

@MainActor
@Observable
final class SplashViewModel {
    private(set) var isActive = true

    func startDismissTimer() {
        Task {
            try? await Task.sleep(for: .seconds(AppConstants.Splash.displayDuration))
            isActive = false
        }
    }
}
