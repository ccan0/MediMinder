//
//  Color+App.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 19.02.2026.
//

import SwiftUI
import UIKit

extension Color {
    enum Splash {
        static let gradientTop = Color(red: 0.55, green: 0.56, blue: 0.93)
        static let gradientBottom = Color(red: 0.25, green: 0.41, blue: 0.88)
    }

    enum Tab {
        static let activeTint = Color(red: 0.25, green: 0.41, blue: 0.88)
        static let inactiveTint = Color(uiColor: .systemGray)
    }

    enum Onboarding {
        static let primary = Color(red: 0.25, green: 0.41, blue: 0.88)

        static let gradientEdge = Color.white
        static let gradientCenter = Color(red: 0.91, green: 0.93, blue: 1.0)
        static let primaryButton = primary
        static let secondaryButtonText = primary
        static let secondaryButtonBorder = primary
        static let dotActive = primary
        static let dotInactive = Color(uiColor: .systemGray4)
        static let titleText = Color(uiColor: .label)
        static let descriptionText = Color(uiColor: .secondaryLabel)
        static let background = Color.white
    }

    enum Dashboard {
        // Primary
        static let primary = Color(hex: 0x4E6CF1)
        static let primaryDark = Color(hex: 0x546FFF)
        static let progressText = Color.white

        // Text
        static let titleText = Color(hex: 0x111827)
        static let subtitleText = Color(hex: 0x9CA3AF)
        static let silverText = Color(hex: 0xE9ECF2)
        static let disabledText = Color(hex: 0xD0D0D0)

        // Backgrounds
        static let cardBackground = Color.white
        static let cardBorder = Color(hex: 0xF5F5F7)
        static let iconBackground = Color(hex: 0xF3F5FE)
        static let disabledBackground = Color(hex: 0xFBFBFC)
        static let disabledIconBackground = Color(hex: 0xF7F7F7)
        static let dayUnselectedBackground = Color(hex: 0xF5F5F7)

        // Weekly Overview
        static let weekCompleted = Color(hex: 0xCFFC51)
        static let weekPartial = Color(hex: 0xD9D9FB)
        static let weekPending = Color(hex: 0xB7B6F8)
        static let weekToday = Color(hex: 0x3760FA)
        static let weekFuture = Color(hex: 0xE5E7EB)
        static let weekDayText = Color(hex: 0x6B7280)

        // FAB
        static let fabBackground = Color(hex: 0x4E6CF1)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
