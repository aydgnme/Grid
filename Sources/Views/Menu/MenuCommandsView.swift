//
//  MenuCommandsView.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import SwiftUI

struct MenuCommandsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("⌃⌥←  Move Left")
            Text("⌃⌥→  Move Right")
            Text("⌃⌥↑  Move Up")
            Text("⌃⌥↓  Move Down")
        }
        .font(.caption)
    }
}

#Preview {
    MenuCommandsView()
}
