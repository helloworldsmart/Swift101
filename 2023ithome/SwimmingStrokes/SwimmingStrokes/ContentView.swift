//
//  ContentView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/16.
//

import SwiftUI

let publicSwimmingPools = [
    PublicSwimmingPool(id: UUID(), name: "Glen Innes Pool", photoCredit: "GlenInnesPool", description: "A hub for your family, Glen Innes Pool and Leisure Centre gets you active with multiple pool, fitness and leisure options. Join a group fitness class, learn to swim, have a splash in the water or book your kids into the onsite crèche – the choice is yours!"),
    PublicSwimmingPool(id: UUID(), name: "Lloyd Elsmore Park Pool", photoCredit: "LloydElsmoreParkPool", description: "Lloyd Elsmore Park Pool and Leisure Centre is your local Pakuranga spot for all things active — jump in!")
]

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
                PublicSwimmingPoolsView(publicSwimmingPools: publicSwimmingPools).tabItem {
                    NavigationLink(destination: PublicSwimmingPoolsView(publicSwimmingPools: publicSwimmingPools)) {
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
