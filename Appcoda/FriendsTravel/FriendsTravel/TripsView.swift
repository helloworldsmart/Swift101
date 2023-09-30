//
//  TripsView.swift
//  FriendsTravel
//
//  Created by Michael on 2023/9/30.
//

import SwiftUI

struct Trip: Identifiable {
    var id: UUID
    var trip: String
}

struct TripsView: View {
    var trips: [Trip]
    var body: some View {
        List {
            ForEach(trips) { (trip) in
//                Text(trip.id.uuidString)
                Text(trip.trip)
            }
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    
    static let trips = [
        Trip(id: UUID(), trip: "Deep Canyon"),
        Trip(id: UUID(), trip: "Skydive Wanaka"),
        Trip(id: UUID(), trip: "Wildwire Wanaka"),
        Trip(id: UUID(), trip: "Glacier Jet")
    ]
    
    static var previews: some View {
        TripsView(trips: trips)
    }
}
