//
//  PublicSwimmingPoolDetailView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import SwiftUI

struct PublicSwimmingPoolDetailView: View {
    var publicSwimmingPool: PoolItem
    
    var body: some View {
        ScrollView { // Using a ScrollView in case the content overflows the screen
            VStack(alignment: .leading, spacing: 20) { // Added spacing for better content separation
                Text(publicSwimmingPool.name)
                    .font(.largeTitle) // Larger font for the name
                    .padding(.top)    // Add padding at the top
                
                if let image = UIImage(named: publicSwimmingPool.photoCredit) { // Ensure the image exists before trying to display it
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10) // Rounded corners for a polished look
                        .shadow(radius: 10) // A subtle shadow for depth
                }
                
                Text("Description")
                    .font(.headline) // Differentiate the "Description" label
                
                Text(publicSwimmingPool.description)
                    .font(.body)
                    .padding(.horizontal) // Horizontal padding for better text layout
                
                Spacer() // Pushes content to the top
            }
            .padding() // Overall padding
        }
        .navigationBarTitle(Text(publicSwimmingPool.name), displayMode: .inline) // Displays the pool name in the navigation bar
    }
}

struct PublicSwimmingPoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PublicSwimmingPoolDetailView(publicSwimmingPool: PoolItem(id: UUID(), name: "Glen Innes Pool", photoCredit: "GlenInnesPool", description: "A hub for your family, Glen Innes Pool and Leisure Centre gets you active with multiple pool, fitness and leisure options. Join a group fitness class, learn to swim, have a splash in the water or book your kids into the onsite crèche – the choice is yours!"))
    }
}
