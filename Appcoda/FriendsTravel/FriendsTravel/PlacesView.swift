//
//  PlacesView.swift
//  FriendsTravel
//
//  Created by Michael on 2023/9/30.
//

import SwiftUI

struct Place: Identifiable {
    var id: UUID
    var place: String
}

struct PlacesView: View {
    var places: [Place]
    var body: some View {
        List {
            ForEach(places) { place in
                Text(place.place)
            }
        }
    }
}

struct PlacesView_Previews: PreviewProvider {
    
    static let places = [
        Place(id: UUID(), place: "Roys Peak"),
        Place(id: UUID(), place: "That Wanaka Tree")
    ]
    
    static var previews: some View {
        PlacesView(places: places)
    }
}
