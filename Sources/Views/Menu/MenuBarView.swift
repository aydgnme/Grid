//
//  MenuBarView.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import AppKit
import SwiftUI

struct MenuBarView: View {
    @ObservedObject var viewModel: MenuBarViewModel
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack(spacing: 8) {
            Text("Grid")
                .font(.headline)

            Divider()
            MenuCommandsView()

            Divider()
            Button("Preferences") {
                NSApp.activate(ignoringOtherApps: true)

                // Find existing preferences window
                if let existingWindow = NSApp.windows.first(where: { $0.identifier?.rawValue == "preferences" }) {
                    existingWindow.makeKeyAndOrderFront(nil)
                } else {
                    // Open new window
                    self.openWindow(id: "preferences")
                }
            }
            Button("Quit") { self.viewModel.quitApp() }
                .keyboardShortcut("q")
        }
        .padding()
        .frame(width: 220)
    }
}

#Preview {
    MenuBarView(viewModel: MenuBarViewModel())
}
