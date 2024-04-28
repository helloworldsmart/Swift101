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
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text("👻")
                .font(.largeTitle)
        })
    }
}
