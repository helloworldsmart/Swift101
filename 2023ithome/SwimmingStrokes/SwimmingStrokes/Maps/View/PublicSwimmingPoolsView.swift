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
                    ForEach(section.items) { item in
                        NavigationLink(destination: PublicSwimmingPoolDetailView(publicSwimmingPool: item)) {
                            Text(item.name)
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("Public Swimming Pools"))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PublicSwimmingPoolsView_Previews: PreviewProvider {
    
    static var previews: some View {
        PublicSwimmingPoolsView()
    }
}
