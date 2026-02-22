//
//  OnboardingView.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import SwiftUI

struct OnboardingView: View {
    @Bindable var viewModel: OnboardingViewModel

    var body: some View {
        VStack(spacing: 0) {
            // Dot indicator
            HStack(spacing: AppConstants.Onboarding.dotSpacing) {
                ForEach(viewModel.pages) { page in
                    Capsule()
                        .fill(page.id == viewModel.currentPageIndex
                            ? Color.Onboarding.dotActive
                        : Color.Onboarding.dotInactive)
                        .frame(
                        height: AppConstants.Onboarding.dotSizeHeight
                    )
                        .animation(.easeInOut(duration: 0.2), value: viewModel.currentPageIndex)
                }
            }
                .accessibilityElement()
                .accessibilityLabel("Page \(viewModel.currentPageIndex + 1) of \(viewModel.pages.count)")
                .padding(.top, AppConstants.Onboarding.dotTopPadding)
                .padding(.horizontal, AppConstants.Onboarding.dotHorizontalPadding)

            TabView(selection: $viewModel.currentPageIndex) {
                ForEach(viewModel.pages) { page in
                    OnboardingPageView(page: page)
                        .tag(page.id)
                }
            }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut(duration: 0.3), value:
                    viewModel.currentPageIndex)

            // Bottom controls
            VStack(spacing: AppConstants.Onboarding.buttonSpacing) {
                PrimaryButton(
                    title: viewModel.continueButtonTitle,
                    action: continueTapped
                )

                SecondaryButton(
                    title: viewModel.skipButtonTitle,
                    action: viewModel.complete
                )
            }
                .padding(.horizontal, AppConstants.Onboarding.horizontalPadding)
                .padding(.vertical, AppConstants.Onboarding.buttonVerticalPadding)
                .background(Color.Onboarding.background)
        }
            .background(
            LinearGradient(
                colors: [
                    Color.Onboarding.gradientEdge,
                    Color.Onboarding.gradientCenter,
                    Color.Onboarding.gradientEdge
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }

    private var isLastPage: Bool {
        viewModel.currentPageIndex == viewModel.pages.count - 1
    }

    private func continueTapped() {
        if isLastPage {
            viewModel.complete()
        } else {
            viewModel.advance()
        }
    }
}
