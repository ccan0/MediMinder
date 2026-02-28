//
//  ProgressCard.swift
//  MediMinder
//

import SwiftUI

struct ProgressCard: View {
    let progress: CGFloat
    let title: String
    let subtitle: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.Urbanist.bold(20))
                    .foregroundStyle(Color.Dashboard.progressText)

                Text(subtitle)
                    .font(.Urbanist.regular(14))
                    .foregroundStyle(Color.Dashboard.silverText)
            }

            Spacer()

            CircularProgressView(progress: progress)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
        .background(
            RoundedRectangle(cornerRadius: AppConstants.Dashboard.progressCardCornerRadius)
                .fill(Color.Dashboard.primary)
        )
    }
}
