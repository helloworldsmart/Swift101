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
                    .fill(.black.opacity(0.4))
                    .scaleEffect(2, anchor: isForward ? .leading : .trailing)
            }
            /// Arrows
            .overlay {
                VStack(spacing: 10) {
                    HStack(spacing: 0) {
                        ForEach(0..<2, id: \.self) { index in
                            Image(systemName: "arrowtriangle.backward.fill")
                        }
                    }
                    .font(.title)
                    .rotationEffect(.init(degrees: isForward ? 180 : 0))
                }
            }
    }
}

struct DoubleTapSeek_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
