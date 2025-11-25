//
//  AccessibilityManager.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import AppKit

final class AccessibilityManager {
    static let shared = AccessibilityManager()
    private init() {}

    func ensurePermission() {
        let opts: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString: true]
        let trusted = AXIsProcessTrustedWithOptions(opts)
        if !trusted {
            print("⚠️ Grid requires Accessibility permission in System Settings → Privacy & Security → Accessibility")
        }
    }

    func isTrusted() -> Bool {
        AXIsProcessTrusted()
    }
}
