//
//  L10n.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import Foundation

enum L10n {
    enum Onboarding {
        static func continueButton(_ locale: Locale) -> String {
            String(localized: "onboarding.continue_button", locale: locale)
        }

        static func skipButton(_ locale: Locale) -> String {
            String(localized: "onboarding.skip_button", locale: locale)
        }

        static func page1Title(_ locale: Locale) -> String {
            String(localized: "onboarding.page1_title", locale: locale)
        }

        static func page1Description(_ locale: Locale) -> String {
            String(localized: "onboarding.page1_description", locale: locale)
        }

        static func page2Title(_ locale: Locale) -> String {
            String(localized: "onboarding.page2_title", locale: locale)
        }

        static func page2Description(_ locale: Locale) -> String {
            String(localized: "onboarding.page2_description", locale: locale)
        }
    }
}
