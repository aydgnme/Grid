//
//  SettingsViewModel.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import Combine
import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var selectedTheme: String
    @Published var currentShortcut: String

    private var cancellables = Set<AnyCancellable>()
    private let preferences = PreferencesService.shared

    init() {
        self.selectedTheme = self.preferences.preferredTheme
        self.currentShortcut = self.preferences.preferredShortcut

        self.preferences.$preferredTheme
            .receive(on: RunLoop.main)
            .assign(to: &self.$selectedTheme)

        self.preferences.$preferredShortcut
            .receive(on: RunLoop.main)
            .assign(to: &self.$currentShortcut)
    }

    func updateTheme(_ theme: String) {
        self.preferences.preferredTheme = theme
    }

    func updateShortcut(_ shortcut: String) {
        self.preferences.preferredShortcut = shortcut
    }
}
