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

    @ObservationIgnored
    private var dismissTask: Task<Void, Never>?

    func startDismissTimer() {
        dismissTask?.cancel()
        dismissTask = Task {
            try? await Task.sleep(for: .seconds(AppConstants.Splash.displayDuration))
            guard !Task.isCancelled else { return }
            isActive = false
        }
    }

    func cancelTimer() {
        dismissTask?.cancel()
        dismissTask = nil
    }
}
