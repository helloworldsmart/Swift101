//
//  ContentView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/16.
//

import SwiftUI

struct ContentView: View {
    var activities: [String] = ["ArtisticSwimming", "Backstroke", "Breaststroke", "Butterfly", "Freestyle"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

    @State private var selected: String = "Freestyle"
    @State private var id = 1

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("🏊🏻‍♂️")
                        .font(.largeTitle.bold())
                        .padding(.top, 10)
                    Text("奮泳向前")
                        .font(.largeTitle.bold())
                    ZStack {
                        Text("🏊🏻‍♂️")
                            .font(.largeTitle.bold())
                            .padding(.leading, 10)
                        Text("🏊🏻‍♂️")
                            .font(.largeTitle.bold())
                            .padding(.leading, 20)
                        Text("🏊🏻‍♂️")
                            .font(.largeTitle.bold())
                            .padding(.leading, 30)
                    }
                }
                Text("今天要揮灑汗水的姿勢")
                    .font(.title2)
                    .padding(.top, 5)
            }
            // TODO:
            #if DEBUG
            FlexButton()
            #endif
            Spacer()
                .frame(height: 40)

            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image("\(selected)")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                    )

                Text("\(selected)!")
                    .font(.title)
                    .padding(.top, 10)
            }
            .transition(.slide)
            .id(id)


            Spacer()

            Button("Try again") {
                withAnimation(.easeIn(duration: 1)) {
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
