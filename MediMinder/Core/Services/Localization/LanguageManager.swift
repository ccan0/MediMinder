//
//  LanguageManager.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import Foundation
import FactoryKit
import Observation

@MainActor
@Observable
final class LanguageManager {
    enum Language: String, CaseIterable {
        case english = "en"
        case turkish = "tr"
    }

    @ObservationIgnored
    @Injected(\.localStorageService) private var storage

    private(set) var currentLanguage: Language = .english

    var locale: Locale {
        Locale(identifier: currentLanguage.rawValue)
    }

    init() {
        if let stored = storage.getString(forKey: AppConstants.Language.preferredLanguageKey),
           let language = Language(rawValue: stored) {
            currentLanguage = language
        } else {
            let deviceCode = Locale.current.language.languageCode?.identifier ?? "en"
            let detected = Language(rawValue: deviceCode) ?? .english
            currentLanguage = detected
            storage.setString(detected.rawValue, forKey: AppConstants.Language.preferredLanguageKey)
        }
    }

    func setLanguage(_ language: Language) {
        currentLanguage = language
        storage.setString(language.rawValue, forKey: AppConstants.Language.preferredLanguageKey)
    }
}
