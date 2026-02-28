//
//  CircularProgress.swift
//  MediMinder
//

import SwiftUI

struct CircularProgressView: View {
    let progress: CGFloat

    private let lineWidth: CGFloat = 6
    private let size: CGFloat = AppConstants.Dashboard.circularProgressSize

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.3), lineWidth: lineWidth)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        colors: [.yellow, .green],
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360 * progress)
                    ),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))

            Text("\(Int(progress * 100))%")
                .font(.Urbanist.bold(16))
                .foregroundStyle(Color.Dashboard.progressText)
        }
        .frame(width: size, height: size)
    }
}
