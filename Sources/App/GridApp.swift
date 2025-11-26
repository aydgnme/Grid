//
//  GridApp.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import SwiftUI

@main
struct GridApp: App {
    @StateObject private var hotkeys = HotKeyManager()
    @StateObject private var menuBarViewModel = MenuBarViewModel()

    var body: some Scene {
        MenuBarExtra("Grid", systemImage: "rectangle.split.3x1") {
            MenuBarView(viewModel: self.menuBarViewModel)
        }

        WindowGroup("Preferences", id: "preferences") {
            SettingsView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .defaultSize(width: 320, height: 220)
    }
}
