//
//  SectionHeader.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import SwiftUI

struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(self.title)
            .font(.headline)
            .foregroundColor(.primary)
    }
}

#Preview {
    SectionHeader(title: "Settings")
}
