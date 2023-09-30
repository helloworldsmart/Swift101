//
//  TripDetails.swift
//  FriendsTravel
//
//  Created by Michael on 2023/9/30.
//

import SwiftUI

struct TripDetails: View {
    var trip: Trip
    var body: some View {
        Text(trip.trip)
    }
}

struct TripDetails_Previews: PreviewProvider {
//    static let trips = [
//        Trip(id: UUID(), trip: "Deep Canyon"),
//        Trip(id: UUID(), trip: "Skydive Wanaka"),
//        Trip(id: UUID(), trip: "Wildwire Wanaka"),
//        Trip(id: UUID(), trip: "Glacier Jet")
//    ]
    static var previews: some View {
        TripDetails(trip: Trip(id: UUID(), trip: "Skydive Wanaka"))
    }
}
