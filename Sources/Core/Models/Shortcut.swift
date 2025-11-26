//
//  Shortcut.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import Combine
import Foundation

struct Shortcut: Identifiable, Codable, Equatable {
    var id = UUID()
    var key: String
    var modifiers: [String]

    var description: String {
        (self.modifiers + [self.key]).joined(separator: " + ")
    }

    static var defaultArrowSet: [Shortcut] = [
        Shortcut(key: "←", modifiers: ["⌃", "⌥"]),
        Shortcut(key: "→", modifiers: ["⌃", "⌥"]),
        Shortcut(key: "↑", modifiers: ["⌃", "⌥"]),
        Shortcut(key: "↓", modifiers: ["⌃", "⌥"]),
    ]
}
