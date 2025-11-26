//
//  SettingsView.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Preferences")
                .font(.title3)
                .bold()

            Picker("Theme", selection: self.$viewModel.selectedTheme) {
                Text("System").tag("System")
                Text("Light").tag("Light")
                Text("Dark").tag("Dark")
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: self.viewModel.selectedTheme) { new in
                self.viewModel.updateTheme(new)
            }

            TextField("Shortcur", text: self.$viewModel.currentShortcut)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    self.viewModel.updateShortcut(self.viewModel.currentShortcut)
                }
            Spacer()
        }
        .padding(20)
        .frame(width: 320, height: 220)
    }
}

#Preview {
    SettingsView()
}
