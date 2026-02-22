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
}
