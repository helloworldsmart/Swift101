//
//  PublicSwimmingPoolsView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import SwiftUI

struct PublicSwimmingPool: Identifiable {
    var id: UUID
    var name: String
    var photoCredit: String
    var description: String
}

struct PublicSwimmingPoolsView: View {
    var publicSwimmingPools: [PublicSwimmingPool]
    var body: some View {
        NavigationView {
            List {
                ForEach(publicSwimmingPools) { (item) in
                    NavigationLink(destination: PublicSwimmingPoolDetailView(publicSwimmingPool: item)) {
                        Text(item.name)
                    }
                }
            }
        }
        .navigationTitle(Text("Public Swimming Pools"))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PublicSwimmingPoolsView_Previews: PreviewProvider {
    
    static let publicSwimmingPools = [
        PublicSwimmingPool(id: UUID(), name: "Glen Innes Pool", photoCredit: "GlenInnesPool", description: "A hub for your family, Glen Innes Pool and Leisure Centre gets you active with multiple pool, fitness and leisure options. Join a group fitness class, learn to swim, have a splash in the water or book your kids into the onsite crèche – the choice is yours!"),
        PublicSwimmingPool(id: UUID(), name: "Lloyd Elsmore Park Pool", photoCredit: "LloydElsmoreParkPool", description: "Lloyd Elsmore Park Pool and Leisure Centre is your local Pakuranga spot for all things active — jump in!")
    ]
    
    static var previews: some View {
        PublicSwimmingPoolsView(publicSwimmingPools: publicSwimmingPools)
    }
}
