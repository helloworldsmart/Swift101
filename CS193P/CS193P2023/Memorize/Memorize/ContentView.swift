//
//  ContentView.swift
//  Memorize
//
//  Created by Michael on 2024/4/28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //  Array<String> 跟 [String] 差別
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "😈"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
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
