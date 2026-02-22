//
//  SecondaryButton.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import SwiftUI

struct SecondaryButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(Color.Onboarding.secondaryButtonText)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppConstants.Onboarding.buttonVerticalPadding)
                .background(
                    RoundedRectangle(cornerRadius: AppConstants.Onboarding.buttonCornerRadius)
                        .stroke(Color.Onboarding.secondaryButtonBorder, lineWidth: 1.5)
                )
        }
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1.0 : 0.6)
        .accessibilityLabel(title)
    }
}
