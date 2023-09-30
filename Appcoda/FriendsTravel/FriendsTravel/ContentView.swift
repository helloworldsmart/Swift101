//
//  ContentView.swift
//  FriendsTravel
//
//  Created by Michael on 2023/9/30.
//

import SwiftUI

let trips = [
    Trip(id: UUID(), trip: "Deep Canyon"),
    Trip(id: UUID(), trip: "Skydive Wanaka"),
    Trip(id: UUID(), trip: "Wildwire Wanaka"),
    Trip(id: UUID(), trip: "Glacier Jet")
]

let places = [
    Place(id: UUID(), place: "Roys Peak"),
    Place(id: UUID(), place: "That Wanaka Tree")
]

struct ContentView: View {

    var body: some View {
        VStack {
            Text(verbatim: "Friends Outings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)

            TabView {
                TripsView(trips: trips).tabItem {
                    NavigationLink(destination: TripsView(trips: trips)) {
                        Image(systemName: "car")
                        Text("Trips") }.tag(1)
                }
                PlacesView(places: places).tabItem {
                    NavigationLink(destination: PlacesView(places: places)) {
                        Image(systemName: "photo")
                        Text("Places") }.tag(2)
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
