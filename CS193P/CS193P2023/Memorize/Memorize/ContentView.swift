//
//  ContentView.swift
//  Memorize
//
//  Created by Michael on 2024/4/28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈"]
            CardView(content: emojis[0], isFaceUp: false)
            CardView(content: emojis[1])
            CardView(content: emojis[2], isFaceUp: true)
            CardView(content: emojis[3], isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture(count: 1) {
            isFaceUp.toggle()
        }
    }
}
