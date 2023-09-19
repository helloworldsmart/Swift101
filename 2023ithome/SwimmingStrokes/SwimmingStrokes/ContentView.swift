//
//  ContentView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/16.
//

import SwiftUI

struct ContentView: View {
    var activities = ["ArtisticSwimming", "Backstroke", "Breaststroke", "Butterfly", "Freestyle"]

    @State private var selected = "ArtisticSwimming"
    @State private var id = 1
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    var body: some View {
        VStack {
            Text("Why not try…")
                    .font(.largeTitle.bold())
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image("\(selected)")
                            .resizable()
                            .clipShape(Circle())
    //                        .font(.system(size: 144))
    //                        .foregroundColor(.white)
                    )
    //
    //            Text("ArtisticSwimming!")
    //                .font(.title)
                Text("\(selected)!")
                    .font(.title)
            }
            Button("Try again") {
                // change activity
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "ArtisticSwimming"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
