//
//  Container+Services.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import FactoryKit

extension Container {

    // MARK: - Core Services

    var localStorageService: Factory<LocalStorageService> {
        self { UserDefaultsService() }
            .singleton
    }

    // MARK: - Navigation

    var appRouter: Factory<AppRouter> {
        self { @MainActor in AppRouter() }
            .singleton
    }

    // MARK: - Localization

    var languageManager: Factory<LanguageManager> {
        self { @MainActor in LanguageManager() }
            .singleton
    }

    // MARK: - ViewModels

    var splashViewModel: Factory<SplashViewModel> {
        self { @MainActor in SplashViewModel() }
    }

    var onboardingViewModel: Factory<OnboardingViewModel> {
        self { @MainActor in OnboardingViewModel() }
    }

    var homeViewModel: Factory<HomeViewModel> {
        self { @MainActor in HomeViewModel() }
    }

    var dashboardViewModel: Factory<DashboardViewModel> {
        self { @MainActor in DashboardViewModel() }
    }
}
