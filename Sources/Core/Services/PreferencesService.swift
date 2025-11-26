//
//  PreferencesService.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import Combine
import Foundation

final class PreferencesService: ObservableObject {
    static let shared = PreferencesService()
    // private init() {}

    private let defaults = UserDefaults.standard
    private let shortcutKey = "preferredShorcut"
    private let themeKey = "preferredTheme"

    @Published var preferredShortcut: String {
        didSet { self.defaults.set(self.preferredShortcut, forKey: self.shortcutKey) }
    }

    @Published var preferredTheme: String {
        didSet { self.defaults.set(self.preferredTheme, forKey: self.themeKey) }
    }

    init(preview _: Bool = false) {
        self.preferredShortcut = self.defaults.string(forKey: self.shortcutKey) ?? "⌃⌥ + arrows"
        self.preferredTheme = self.defaults.string(forKey: self.themeKey) ?? "System"
    }
}
