//
//  RootView.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 19.02.2026.
//

import SwiftUI
import FactoryKit

struct RootView: View {
    @Injected(\.appRouter) private var appRouter
    @Injected(\.onboardingViewModel) private var onboardingViewModel
    @Injected(\.splashViewModel) private var splashViewModel
    @Injected(\.homeViewModel) private var homeViewModel

    var body: some View {
        ZStack {
            switch appRouter.currentState {
            case .splash:
                Color.clear

            case .onboarding:
                OnboardingView(viewModel: onboardingViewModel)
                    .transition(.opacity)

            case .home:
                HomeView(viewModel: homeViewModel)
                    .transition(.opacity)
            }

            if splashViewModel.isActive {
                SplashView()
                    .transition(.opacity)
            }
        }
        .animation(.easeOut(duration: AppConstants.Splash.fadeOutDuration), value: splashViewModel.isActive)
        .animation(.easeOut(duration: AppConstants.Splash.fadeOutDuration), value: appRouter.currentState)
        .onAppear {
            splashViewModel.startDismissTimer()
        }
        .onChange(of: splashViewModel.isActive) { _, isActive in
            if !isActive {
                appRouter.handleSplashCompleted(
                    hasSeenOnboarding: onboardingViewModel.hasCompletedOnboarding
                )
            }
        }
    }
}

#Preview {
    RootView()
}
