//
//  PrimaryButton.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true
    var isLoading: Bool = false

    var body: some View {
        Button(action: action) {
            Group {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                }
            }
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppConstants.Onboarding.buttonVerticalPadding)
            .background(Color.Onboarding.primaryButton)
            .clipShape(RoundedRectangle(cornerRadius: AppConstants.Onboarding.buttonCornerRadius))
        }
        .disabled(!isEnabled || isLoading)
        .opacity(isEnabled && !isLoading ? 1.0 : 0.6)
        .accessibilityLabel(title)
    }
}
