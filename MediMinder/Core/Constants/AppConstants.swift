//
//  AppConstants.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 19.02.2026.
//

import Foundation

enum AppConstants {
    enum Splash {
        static let displayDuration: TimeInterval = 2.0
        static let fadeOutDuration: TimeInterval = 0.4
        static let logoWidthRatio: CGFloat = 0.55
    }

    enum Onboarding {
        // UserDefaults key
        static let hasSeenKey = "hasSeenOnboarding"

        // Layout
        static let horizontalPadding: CGFloat = 32
        static let bottomPadding: CGFloat = 40
        static let buttonVerticalPadding: CGFloat = 16
        static let buttonCornerRadius: CGFloat = 14
        static let buttonSpacing: CGFloat = 12
        static let dotSizeHeight: CGFloat = 2
        static let dotHorizontalPadding: CGFloat = 16
        static let dotSpacing: CGFloat = 8
        static let dotTopPadding: CGFloat = 24
        static let textSpacing: CGFloat = 12
        static let textAreaVerticalPadding: CGFloat = 32
        static let illustrationIconSize: CGFloat = 80
        static let cornerRadius: CGFloat = 40
    }

    enum Dashboard {
        static let horizontalPadding: CGFloat = 17
        static let sectionSpacing: CGFloat = 16
        static let cardCornerRadius: CGFloat = 20
        static let progressCardCornerRadius: CGFloat = 12
        static let cardPadding: CGFloat = 16
        static let iconSize: CGFloat = 48
        static let circularProgressSize: CGFloat = 60
        static let dayPickerTopCornerRadius: CGFloat = 20
        static let dayCircleSize: CGFloat = 32
        static let weekCircleSize: CGFloat = 26
        static let fabSize: CGFloat = 56
        static let fabIconSize: CGFloat = 24
        static let medicationCardHeight: CGFloat = 89
        static let takeNowCornerRadius: CGFloat = 21
    }

    enum Language {
        static let preferredLanguageKey = "preferredLanguage"
    }
}
