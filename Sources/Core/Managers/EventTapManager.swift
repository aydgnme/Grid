//
//  EventTapManager.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import AppKit
import ApplicationServices

/// Manages global event taps for drag-and-drop window snapping
/// Future: snap-on-drag functionality
class EventTapManager {
    private var eventTap: CFMachPort?

    init() {
        // swiftlint:disable:next todo
        // TODO: Implement event tap for drag detection
    }

    deinit {
        stopEventTap()
    }

    func startEventTap() {
        // swiftlint:disable:next todo
        // TODO: Create event tap for mouse drag events
    }

    func stopEventTap() {
        if let tap = eventTap {
            CFMachPortInvalidate(tap)
            self.eventTap = nil
        }
    }
}
