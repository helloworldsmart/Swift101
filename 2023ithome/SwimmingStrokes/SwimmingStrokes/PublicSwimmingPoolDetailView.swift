//
//  PublicSwimmingPoolDetailView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import SwiftUI

struct PublicSwimmingPoolDetailView: View {
    var publicSwimmingPool: PublicSwimmingPool
    var body: some View {
        VStack {
            Text("Hello, \(publicSwimmingPool.name)")
            Image(publicSwimmingPool.photoCredit)
                .resizable()
                .scaledToFit()
            Text(publicSwimmingPool.description)
        }
    }
}

struct PublicSwimmingPoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PublicSwimmingPoolDetailView(publicSwimmingPool: PublicSwimmingPool(id: UUID(), name: "Glen Innes Pool", photoCredit: "GlenInnesPool", description: "A hub for your family, Glen Innes Pool and Leisure Centre gets you active with multiple pool, fitness and leisure options. Join a group fitness class, learn to swim, have a splash in the water or book your kids into the onsite crèche – the choice is yours!"))
    }
}
