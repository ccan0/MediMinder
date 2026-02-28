//
//  MedicationItem.swift
//  MediMinder
//

import Foundation

enum MedicationStatus {
    case takeNow
    case upcoming(timeRemaining: String)
    case completed
}

struct MedicationItem: Identifiable {
    let id: UUID
    let name: String
    let nextDoseTime: String
    let status: MedicationStatus

    init(
        id: UUID = UUID(),
        name: String,
        nextDoseTime: String,
        status: MedicationStatus
    ) {
        self.id = id
        self.name = name
        self.nextDoseTime = nextDoseTime
        self.status = status
    }
}

enum WeekDayStatus {
    case completed
    case partial
    case pending
    case today
    case future
}

struct WeekOverviewItem: Identifiable {
    let id = UUID()
    let dayLetter: String
    let status: WeekDayStatus
}
