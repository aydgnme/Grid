//
//  ToggleRow.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import SwiftUI

struct ToggleRow: View {
    let title: String
    @Binding var isOn: Bool

    var body: some View {
        Toggle(self.title, isOn: self.$isOn)
    }
}

#Preview {
    ToggleRow(title: "Enable Feature", isOn: .constant(true))
}
