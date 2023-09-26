//
//  LibsManager.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/26.
//

import SwiftUI
#if DEBUG
import FLEX
#endif

class LibsManager {
    static let shared = LibsManager()

    func setupLibs() {
        // No need for UIWindow in SwiftUI
        let libsManager = LibsManager.shared
        libsManager.setupFLEX()
    }
    
    func setupFLEX() {
        #if DEBUG
        FLEXManager.shared.isNetworkDebuggingEnabled = true
        #endif
    }
}

extension LibsManager {
    func showFlex() {
        #if DEBUG
        FLEXManager.shared.showExplorer()
        #endif
    }
}
