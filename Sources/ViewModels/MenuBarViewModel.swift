//
//  MenuBarViewModel.swift
//  Grid
//
//  Created by Mert Aydogan on 25.11.2025.
//

import Combine
import Foundation
import SwiftUI

final class MenuBarViewModel: ObservableObject {
    func quitApp() { NSApplication.shared.terminate(nil) }
}
