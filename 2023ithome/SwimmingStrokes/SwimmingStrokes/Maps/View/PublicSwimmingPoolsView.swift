//
//  PublicSwimmingPoolsView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import SwiftUI

struct PublicSwimmingPoolsView: View {
    
    let pools = Bundle.main.decode([PoolsSection].self, from: "pools.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pools) { (section) in
                    Section(header: Text(section.name).font(.headline)) { // Added a section header for better organization
                        ForEach(section.items) { item in
                            NavigationLink(destination: PublicSwimmingPoolDetailView(publicSwimmingPool: item)) {
                                HStack {
                                    Image(systemName: "mappin.and.ellipse") // Example image, consider using a custom icon or pool image
                                    Text(item.name)
                                        .font(.body)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("Public Swimming Pools"))
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.blue) // Change the accent color for a fresh look
    }
}

struct PublicSwimmingPoolsView_Previews: PreviewProvider {
    
    static var previews: some View {
        PublicSwimmingPoolsView()
    }
}
