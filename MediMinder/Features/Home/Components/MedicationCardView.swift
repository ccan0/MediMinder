//
//  MedicationCardView.swift
//  MediMinder
//

import SwiftUI

struct MedicationCardView: View {
    let medication: MedicationItem
    var onTakeNow: (() -> Void)?

    private var isCompleted: Bool {
        if case .completed = medication.status { return true }
        return false
    }

    var body: some View {
        HStack(spacing: 12) {
            medicationIcon
            medicationInfo
            Spacer()
            trailingContent
        }
        .padding(AppConstants.Dashboard.cardPadding)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: AppConstants.Dashboard.cardCornerRadius)
                .fill(isCompleted ? Color.Dashboard.disabledBackground : Color.Dashboard.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: AppConstants.Dashboard.cardCornerRadius)
                        .stroke(Color.Dashboard.cardBorder, lineWidth: 1)
                )
        )
    }

    private var medicationIcon: some View {
        ZStack {
            Circle()
                .fill(isCompleted ? Color.Dashboard.disabledIconBackground : Color.Dashboard.iconBackground)
                .frame(width: AppConstants.Dashboard.iconSize, height: AppConstants.Dashboard.iconSize)

            Image(systemName: "pill.fill")
                .font(.system(size: 20))
                .foregroundStyle(isCompleted ? Color.Dashboard.disabledText : Color.Dashboard.primary)
        }
    }

    private var medicationInfo: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(medication.name)
                .font(.Urbanist.semiBold(14))
                .foregroundStyle(isCompleted ? Color.Dashboard.disabledText : Color.Dashboard.titleText)
                .lineLimit(1)

            Text("Next: \(medication.nextDoseTime)")
                .font(.Urbanist.regular(12))
                .foregroundStyle(isCompleted ? Color.Dashboard.disabledText : Color.Dashboard.subtitleText)
        }
    }

    @ViewBuilder
    private var trailingContent: some View {
        switch medication.status {
        case .takeNow:
            Button(action: { onTakeNow?() }) {
                Text("Take Now")
                    .font(.Urbanist.medium(14))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(Color.Dashboard.primary)
                    )
            }

        case .upcoming(let timeRemaining):
            Text(timeRemaining)
                .font(.Urbanist.regular(14))
                .foregroundStyle(Color.Dashboard.subtitleText)

        case .completed:
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.green)
        }
    }
}
