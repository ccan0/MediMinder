//
//  SplashView.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 19.02.2026.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.Splash.gradientTop, Color.Splash.gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Image(.splashLogo)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { width, _ in
                    width * AppConstants.Splash.logoWidthRatio
                }
        }
    }
}

#Preview {
    SplashView()
}
