//
//  ContentView.swift
//  Memorize
//
//  Created by Michael on 2021/3/29.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃", "🥳", "🥰", "😘", "😍", "🤩", "😈", "👻", "😽", "🦊", "🐝", "🦄"]
    
    @State var cardCount: Int = 4

    var body: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
            Button("Add Card") {
                cardCount += 1
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
