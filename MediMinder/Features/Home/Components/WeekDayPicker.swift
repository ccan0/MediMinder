//
//  WeekDayPicker.swift
//  MediMinder
//

import SwiftUI

struct WeekDayPickerView: View {
    let todayIndex: Int
    let days: [(letter: String, date: Int)]

    var body: some View {
        HStack {
            ForEach(Array(days.enumerated()), id: \.offset) { index, day in
                dayColumn(index: index, letter: day.letter, date: day.date)
                if index < days.count - 1 {
                    Spacer()
                }
            }
        }
        .padding(.horizontal, AppConstants.Dashboard.cardPadding)
        .padding(.vertical, 15)
    }

    private func dayColumn(index: Int, letter: String, date: Int) -> some View {
        let isToday = todayIndex == index

        return VStack(spacing: 12) {
            Text(letter)
                .font(.Urbanist.medium(14))
                .foregroundStyle(isToday ? Color.Dashboard.primaryDark : Color.Dashboard.titleText)

            ZStack {
                Circle()
                    .fill(isToday ? Color.Dashboard.primaryDark : Color.Dashboard.dayUnselectedBackground)
                    .frame(
                        width: AppConstants.Dashboard.dayCircleSize,
                        height: AppConstants.Dashboard.dayCircleSize
                    )

                Text("\(date)")
                    .font(.Urbanist.medium(14))
                    .foregroundStyle(isToday ? .white : Color.Dashboard.titleText)
            }
        }
    }
}
