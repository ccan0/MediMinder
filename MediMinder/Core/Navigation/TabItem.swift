//
//  TabItem.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 22.02.2026.
//

import Foundation

enum TabItem: Int, CaseIterable, Identifiable {
    case home = 0
    case calendar = 1
    case profile = 2

    var id: Int { rawValue }

    var icon: String {
        switch self {
        case .home: "house.fill"
        case .calendar: "calendar"
        case .profile: "person.fill"
        }
    }

    func title(locale: Locale) -> String {
        switch self {
        case .home: L10n.Tab.home(locale)
        case .calendar: L10n.Tab.calendar(locale)
        case .profile: L10n.Tab.profile(locale)
        }
    }
}
