//
//  WeeklyOverviewCard.swift
//  MediMinder
//

import SwiftUI

struct WeeklyOverviewCard: View {
    let items: [WeekOverviewItem]

    var body: some View {
        HStack {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                dayColumn(item)
                if index < items.count - 1 {
                    Spacer()
                }
            }
        }
        .padding(AppConstants.Dashboard.cardPadding)
        .background(
            RoundedRectangle(cornerRadius: AppConstants.Dashboard.cardCornerRadius)
                .fill(Color.Dashboard.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: AppConstants.Dashboard.cardCornerRadius)
                        .stroke(Color.Dashboard.cardBorder, lineWidth: 1)
                )
        )
    }

    private func dayColumn(_ item: WeekOverviewItem) -> some View {
        VStack(spacing: 12) {
            Text(item.dayLetter)
                .font(.Urbanist.regular(12))
                .foregroundStyle(
                    item.status == .future ? Color.Dashboard.subtitleText : Color.Dashboard.weekDayText
                )

            statusCircle(for: item.status)
        }
    }

    @ViewBuilder
    private func statusCircle(for status: WeekDayStatus) -> some View {
        let size = AppConstants.Dashboard.weekCircleSize

        switch status {
        case .completed:
            Circle()
                .fill(Color.Dashboard.weekCompleted)
                .frame(width: size, height: size)

        case .partial:
            Circle()
                .fill(Color.Dashboard.weekPartial)
                .frame(width: size, height: size)

        case .pending:
            Circle()
                .stroke(Color.Dashboard.weekPending, lineWidth: 1.5)
                .frame(width: size, height: size)

        case .today:
            ZStack {
                Circle()
                    .fill(Color.Dashboard.weekToday)
                    .frame(width: size, height: size)

                Circle()
                    .fill(.white)
                    .frame(width: 8, height: 8)
            }

        case .future:
            Circle()
                .fill(Color.Dashboard.weekFuture)
                .frame(width: size, height: size)
        }
    }
}
