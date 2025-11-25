//
//  HotKeyManager.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import AppKit
import Combine
import HotKey

final class HotKeyManager: ObservableObject {
    private var left: HotKey?
    private var right: HotKey?
    private var upArrow: HotKey?
    private var downArrow: HotKey?

    init() {
        self.setup()
        AccessibilityManager.shared.ensurePermission()
    }

    private func setup() {
        self.left = HotKey(key: .leftArrow, modifiers: [.control, .option])
        self.right = HotKey(key: .rightArrow, modifiers: [.control, .option])
        self.upArrow = HotKey(key: .upArrow, modifiers: [.control, .option])
        self.downArrow = HotKey(key: .downArrow, modifiers: [.control, .option])

        self.left?.keyDownHandler = { self.move(.left) }
        self.right?.keyDownHandler = { self.move(.right) }
        self.upArrow?.keyDownHandler = { self.move(.up) }
        self.downArrow?.keyDownHandler = { self.move(.down) }
    }

    private func move(_ direction: Direction) {
        guard AccessibilityManager.shared.isTrusted() else { return }
        switch direction {
        case .left:
            if let rect = ScreenManager.leftHalf() { WindowManager.shared.moveFocusedWindow(to: rect) }
        case .right:
            if let rect = ScreenManager.rightHalf() { WindowManager.shared.moveFocusedWindow(to: rect) }
        case .up:
            if let rect = ScreenManager.topHalf() { WindowManager.shared.moveFocusedWindow(to: rect) }
        case .down:
            if let rect = ScreenManager.bottomHalf() { WindowManager.shared.moveFocusedWindow(to: rect) }
        }
    }

    // swiftlint:disable:next identifier_name
    private enum Direction { case left, right, up, down }
}
