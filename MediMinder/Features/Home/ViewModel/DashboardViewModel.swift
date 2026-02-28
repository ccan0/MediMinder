//
//  DashboardViewModel.swift
//  MediMinder
//

import Foundation
import FactoryKit
import Observation

@MainActor
@Observable
final class DashboardViewModel {
    var progress: CGFloat = 0.75
    var medications: [MedicationItem] = []
    var weekOverview: [WeekOverviewItem] = []

    private let calendar = Calendar.current
    private var languageManager: LanguageManager

    var locale: Locale {
        languageManager.locale
    }

    var currentWeekDays: [(letter: String, date: Int)] {
        let today = Date()
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) else {
            return []
        }

        let dayLetters = ["S", "M", "T", "W", "T", "F", "S"]
        var days: [(letter: String, date: Int)] = []

        for offset in 0..<7 {
            guard let date = calendar.date(byAdding: .day, value: offset, to: weekInterval.start) else {
                continue
            }
            let dayOfMonth = calendar.component(.day, from: date)
            let weekday = calendar.component(.weekday, from: date) - 1
            let letter = dayLetters[weekday]
            days.append((letter: letter, date: dayOfMonth))
        }
        return days
    }

    var todayIndex: Int {
        let today = Date()
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) else {
            return 0
        }
        let daysDiff = calendar.dateComponents([.day], from: weekInterval.start, to: today).day ?? 0
        return daysDiff
    }

    init() {
        languageManager = Container.shared.languageManager()
        loadMockData()
    }

    private func loadMockData() {
        medications = [
            MedicationItem(
                name: "Amoxicillin 500mg",
                nextDoseTime: "2:00 PM",
                status: .takeNow
            ),
            MedicationItem(
                name: "Ibuprofen 200mg",
                nextDoseTime: "4:00 PM",
                status: .upcoming(timeRemaining: "In 2 hours")
            ),
            MedicationItem(
                name: "Vitamin D3",
                nextDoseTime: "8:00 AM",
                status: .completed
            )
        ]

        weekOverview = [
            WeekOverviewItem(dayLetter: "M", status: .partial),
            WeekOverviewItem(dayLetter: "T", status: .completed),
            WeekOverviewItem(dayLetter: "W", status: .pending),
            WeekOverviewItem(dayLetter: "T", status: .completed),
            WeekOverviewItem(dayLetter: "F", status: .today),
            WeekOverviewItem(dayLetter: "S", status: .future),
            WeekOverviewItem(dayLetter: "S", status: .future)
        ]
    }
}
