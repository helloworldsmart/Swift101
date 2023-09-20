//
//  ContentView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("奮泳向前")
                .font(.largeTitle.bold())

            Text("今天要揮灑汗水的姿勢")
                .font(.title2)
                .padding(.top, 5)

            Circle()
                .fill(.blue)
                .padding()
                .overlay(
                    Image("ArtisticSwimming")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                )

            Text("ArtisticSwimming!")
                .font(.title)
                .padding(.top, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
