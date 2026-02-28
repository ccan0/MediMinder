//
//  DashboardView.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 22.02.2026.
//

import SwiftUI
import FactoryKit

struct DashboardView: View {
    @Bindable var viewModel: DashboardViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerSection
                contentSection
            }
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.Dashboard.cardBackground)
    }

    // MARK: - Header

    private var headerSection: some View {
        ZStack(alignment: .bottom) {
            Image(.dashboardHeader)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .accessibilityHidden(true)

            VStack(spacing: 12) {
                ProgressCard(
                    progress: viewModel.progress,
                    title: L10n.Dashboard.yourProgress(viewModel.locale),
                    subtitle: L10n.Dashboard.monthlyReport(viewModel.locale)
                )
                .padding(.horizontal, AppConstants.Dashboard.horizontalPadding)

                weekDayPickerSection
            }
        }
    }

    private var weekDayPickerSection: some View {
        WeekDayPickerView(
            todayIndex: viewModel.todayIndex,
            days: viewModel.currentWeekDays
        )
        .background(Color.Dashboard.cardBackground)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: AppConstants.Dashboard.dayPickerTopCornerRadius,
                topTrailingRadius: AppConstants.Dashboard.dayPickerTopCornerRadius
            )
        )
    }

    // MARK: - Content

    private var contentSection: some View {
        VStack(spacing: AppConstants.Dashboard.sectionSpacing) {
            upcomingMedicationsSection
            thisWeekSection
        }
        .padding(.horizontal, AppConstants.Dashboard.horizontalPadding)
        .padding(.bottom, 24)
    }

    // MARK: - Upcoming Medications

    private var upcomingMedicationsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionTitle(L10n.Dashboard.upcomingMedications(viewModel.locale))

            ForEach(viewModel.medications) { medication in
                MedicationCardView(medication: medication)
            }
        }
    }

    // MARK: - This Week

    private var thisWeekSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionTitle(L10n.Dashboard.thisWeek(viewModel.locale))

            WeeklyOverviewCard(items: viewModel.weekOverview)
        }
    }

    // MARK: - Helpers

    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.Urbanist.semiBold(14))
            .foregroundStyle(Color.Dashboard.titleText)
    }
}
