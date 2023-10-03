//
//  ContentView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/16.
//

import SwiftUI

struct ContentView: View {
    
    // TODO:
    @ObservedObject var settings = GlobalSettings()
    
    var body: some View {
        VStack {
            Text(verbatim: "Water boys")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
            
            TabView(selection: $settings.selectedTabIndex) {
                HomeView().tabItem {
                    NavigationLink(destination: HomeView()) {
                        Label("Home", systemImage: "house")
                    }
                }.tag(1)
                SwimmingStrokesList().tabItem {
                    NavigationLink(destination: SwimmingStrokesList()) {
                        Label("List", systemImage: "list.clipboard.fill")
                    }
                }.tag(2)
                PublicSwimmingPoolsView().tabItem {
                    NavigationLink(destination: PublicSwimmingPoolsView()) {
                        Label("Maps", systemImage: "map")
                    }
                }.tag(3)
                SettingsView().tabItem {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape")
                    }
                }.tag(4)
                FourTargetButtonView(settings: settings).tabItem {
                    NavigationLink(destination: FourTargetButtonView(settings: settings)) {
                        Label("hands", systemImage: "hands.sparkles")
                    }
                }.tag(5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
