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
            Text(verbatim: "Water boys")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
            
            TabView {
                HomeView().tabItem {
                    NavigationLink(destination: HomeView()) {
                        Label("Home", systemImage: "house")
                    }.tag(1)
                }
                SwimmingStrokesList().tabItem {
                    NavigationLink(destination: SwimmingStrokesList()) {
                        Label("List", systemImage: "list.clipboard.fill")
                    }.tag(1)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
