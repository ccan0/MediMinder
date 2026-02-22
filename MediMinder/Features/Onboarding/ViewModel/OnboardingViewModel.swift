//
//  OnboardingViewModel.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import Foundation
import FactoryKit
import Observation

@MainActor
@Observable
final class OnboardingViewModel {
    @ObservationIgnored
    @Injected(\.localStorageService) private var storageService

    @ObservationIgnored
    @Injected(\.appRouter) private var appRouter

    private var languageManager: LanguageManager

    var currentPageIndex = 0

    var hasCompletedOnboarding: Bool {
        storageService.getBool(forKey: AppConstants.Onboarding.hasSeenKey)
    }

    var pages: [OnboardingPage] {
        let locale = languageManager.locale
        return [
            OnboardingPage(
                id: 0,
                image: .onboardingMedications,
                title: L10n.Onboarding.page1Title(locale),
                description: L10n.Onboarding.page1Description(locale)
            ),
            OnboardingPage(
                id: 1,
                image: .onboardingReminders,
                title: L10n.Onboarding.page2Title(locale),
                description: L10n.Onboarding.page2Description(locale)
            )
        ]
    }

    var continueButtonTitle: String {
        L10n.Onboarding.continueButton(languageManager.locale)
    }

    var skipButtonTitle: String {
        L10n.Onboarding.skipButton(languageManager.locale)
    }

    init() {
        languageManager = Container.shared.languageManager()
    }

    func advance() {
        guard currentPageIndex < pages.count - 1 else { return }
        currentPageIndex += 1
    }

    func complete() {
        storageService.setBool(true, forKey: AppConstants.Onboarding.hasSeenKey)
        appRouter.handleOnboardingCompleted()
    }
}
