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

    var body: some Scene {
        MenuBarExtra("Grid", systemImage: "rectangle.split.3x1") {
            ContentView()
        }
    }
}
