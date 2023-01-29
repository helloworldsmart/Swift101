//
//  iDineApp.swift
//  iDine
//
//  Created by Michael on 2022/12/1.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
