//
//  SwimmingStrokesApp.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/16.
//

import SwiftUI

@main
struct SwimmingStrokesApp: App {
    init() {
        LibsManager.shared.setupLibs()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
