//
//  ScreenManager.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import AppKit

enum ScreenManager {
    static func mainVisibleFrame() -> CGRect? {
        NSScreen.main?.visibleFrame
    }

    static func leftHalf() -> CGRect? {
        guard let frame = mainVisibleFrame() else { return nil }

        return CGRect(
            x: frame.minX,
            y: frame.minY,
            width: frame.width / 2,
            height: frame.height
        )
    }

    static func rightHalf() -> CGRect? {
        guard let frame = mainVisibleFrame() else { return nil }

        return CGRect(
            x: frame.midX,
            y: frame.minY,
            width: frame.width / 2,
            height: frame.height
        )
    }

    static func topHalf() -> CGRect? {
        guard let frame = mainVisibleFrame() else { return nil }

        return CGRect(
            x: frame.minX,
            y: frame.midY,
            width: frame.width,
            height: frame.height / 2
        )
    }

    static func bottomHalf() -> CGRect? {
        guard let frame = mainVisibleFrame() else { return nil }

        return CGRect(
            x: frame.minX,
            y: frame.minY,
            width: frame.width,
            height: frame.height / 2
        )
    }
}
