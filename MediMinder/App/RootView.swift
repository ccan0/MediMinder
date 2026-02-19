//
//  RootView.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 19.02.2026.
//

import SwiftUI

struct RootView: View {
    @State private var splashViewModel = SplashViewModel()

    var body: some View {
        ZStack {
            ContentView()

            if splashViewModel.isActive {
                SplashView()
                    .transition(.opacity)
            }
        }
        .animation(.easeOut(duration: AppConstants.Splash.fadeOutDuration), value: splashViewModel.isActive)
        .onAppear {
            splashViewModel.startDismissTimer()
        }
    }
}

#Preview {
    RootView()
}
