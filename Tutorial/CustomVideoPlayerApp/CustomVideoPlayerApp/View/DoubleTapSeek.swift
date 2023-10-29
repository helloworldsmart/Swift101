//
//  DoubleTapSeek.swift
//  CustomVideoPlayerApp
//
//  Created by Michael on 2023/10/29.
//

import SwiftUI

// Seeking Video Forward/Backward with Double Tap Animation
struct DoubleTapSeek: View {
    var isForward: Bool = false
//    var onTap: Bool = false
    var onTap: () -> ()
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .overlay {
                Circle()
            }
    }
}

struct DoubleTapSeek_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
