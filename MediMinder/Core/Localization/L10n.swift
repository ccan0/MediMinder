//
//  L10n.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import Foundation

enum L10n {
    enum Tab {
        static func home(_ locale: Locale) -> String {
            String(localized: "tab.home", locale: locale)
        }

        static func calendar(_ locale: Locale) -> String {
            String(localized: "tab.calendar", locale: locale)
        }

        static func profile(_ locale: Locale) -> String {
            String(localized: "tab.profile", locale: locale)
        }
    }

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

    enum Dashboard {
        static func yourProgress(_ locale: Locale) -> String {
            String(localized: "dashboard.your_progress", locale: locale)
        }

        static func monthlyReport(_ locale: Locale) -> String {
            String(localized: "dashboard.monthly_report", locale: locale)
        }

        static func upcomingMedications(_ locale: Locale) -> String {
            String(localized: "dashboard.upcoming_medications", locale: locale)
        }

        static func thisWeek(_ locale: Locale) -> String {
            String(localized: "dashboard.this_week", locale: locale)
        }

        static func takeNow(_ locale: Locale) -> String {
            String(localized: "dashboard.take_now", locale: locale)
        }
    }
}
