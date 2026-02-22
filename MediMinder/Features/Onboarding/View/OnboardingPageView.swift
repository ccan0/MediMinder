//
//  OnboardingPageView.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 0) {
            // Illustration area — top ~55%
            Image(page.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .accessibilityHidden(true)

            // Text area — bottom ~45%
            VStack(spacing: AppConstants.Onboarding.textSpacing) {
                Text(page.title)
                    .font(.title.bold())
                    .foregroundStyle(Color.Onboarding.titleText)
                    .multilineTextAlignment(.center)
                    .accessibilityAddTraits(.isHeader)

                Text(page.description)
                    .font(.body)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundStyle(Color.Onboarding.descriptionText)
                    .multilineTextAlignment(.center)
            }
                .padding(.vertical, AppConstants.Onboarding.textAreaVerticalPadding)
                .padding(.horizontal, AppConstants.Onboarding.horizontalPadding)
                .background(Color.Onboarding.background)
                .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: AppConstants.Onboarding.cornerRadius,
                    topTrailingRadius: AppConstants.Onboarding.cornerRadius
                )
            )
        }
    }
}
