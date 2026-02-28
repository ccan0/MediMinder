//
//  HomeView.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 22.02.2026.
//

import SwiftUI
import FactoryKit

struct HomeView: View {
    @Bindable var viewModel: HomeViewModel

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TabView(selection: $viewModel.selectedTab) {
                ForEach(TabItem.allCases) { tab in
                    tabContent(for: tab)
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.title(locale: viewModel.locale))
                        }
                        .tag(tab)
                }
            }
            .tint(Color.Tab.activeTint)

            if viewModel.selectedTab == .home {
                fabButton
            }
        }
    }

    @ViewBuilder
    private func tabContent(for tab: TabItem) -> some View {
        switch tab {
        case .home:
            DashboardView(viewModel: viewModel.dashboardViewModel)
        case .calendar:
            CalendarView()
        case .profile:
            ProfileView()
        }
    }

    private var fabButton: some View {
        Button(action: {}) {
            Image(systemName: "plus")
                .font(.system(size: AppConstants.Dashboard.fabIconSize, weight: .medium))
                .foregroundStyle(.white)
                .frame(
                    width: AppConstants.Dashboard.fabSize,
                    height: AppConstants.Dashboard.fabSize
                )
                .background(
                    Circle()
                        .fill(Color.Dashboard.fabBackground)
                        .shadow(
                            color: .black.opacity(0.15),
                            radius: 10,
                            x: 0,
                            y: 4
                        )
                )
        }
        .padding(.trailing, 20)
        .padding(.bottom, 100)
    }
}
