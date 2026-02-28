//
//  HomeViewModel.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 22.02.2026.
//

import Foundation
import FactoryKit
import Observation

@MainActor
@Observable
final class HomeViewModel {
    var selectedTab: TabItem = .home

    private(set) var dashboardViewModel: DashboardViewModel

    private var languageManager: LanguageManager

    var locale: Locale {
        languageManager.locale
    }

    init() {
        languageManager = Container.shared.languageManager()
        dashboardViewModel = Container.shared.dashboardViewModel()
    }
}
