//
//  WindowManager.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import AppKit
import ApplicationServices

final class WindowManager {
    static let shared = WindowManager()
    private init() {}

    private func focusedWindow() -> AXUIElement? {
        let systemWide = AXUIElementCreateSystemWide()
        var app: CFTypeRef?
        guard AXUIElementCopyAttributeValue(systemWide, kAXFocusedApplicationAttribute as CFString, &app) == .success,
              let appRef = app else { return nil }

        // swiftlint:disable:next force_cast
        let appElement = appRef as! AXUIElement

        var window: CFTypeRef?
        guard AXUIElementCopyAttributeValue(
            appElement,
            kAXFocusedWindowAttribute as CFString,
            &window
        ) ==
            .success,
            let windowRef = window else { return nil }

        // swiftlint:disable:next force_cast
        return windowRef as! AXUIElement
    }

    private func frame(of window: AXUIElement) -> CGRect? {
        var positionValue: CFTypeRef?
        var sizeValue: CFTypeRef?
        guard AXUIElementCopyAttributeValue(window, kAXPositionAttribute as CFString, &positionValue) == .success,
              AXUIElementCopyAttributeValue(window, kAXSizeAttribute as CFString, &sizeValue) == .success,
              let positionRef = positionValue,
              let sizeRef = sizeValue else { return nil }

        // swiftlint:disable:next force_cast
        let position = positionRef as! AXValue
        // swiftlint:disable:next force_cast
        let size = sizeRef as! AXValue

        var origin = CGPoint.zero
        var dimensions = CGSize.zero
        guard AXValueGetValue(position, .cgPoint, &origin),
              AXValueGetValue(size, .cgSize, &dimensions)
        else {
            return nil
        }
        return CGRect(origin: origin, size: dimensions)
    }

    private func setFrame(_ frame: CGRect, for window: AXUIElement) {
        var origin = frame.origin
        var size = frame.size
        if let positionValue = AXValueCreate(.cgPoint, &origin) {
            AXUIElementSetAttributeValue(window, kAXPositionAttribute as CFString, positionValue)
        }
        if let sizeValue = AXValueCreate(.cgSize, &size) {
            AXUIElementSetAttributeValue(window, kAXSizeAttribute as CFString, sizeValue)
        }
    }

    func moveFocusedWindow(to rect: CGRect) {
        guard let win = focusedWindow() else { return }
        self.setFrame(rect, for: win)
    }
}
