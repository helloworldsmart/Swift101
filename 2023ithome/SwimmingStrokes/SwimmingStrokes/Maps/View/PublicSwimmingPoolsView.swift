//
//  PublicSwimmingPoolsView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import SwiftUI

struct PublicSwimmingPoolsView: View {
    
    let pools = Bundle.main.decode([PoolsSection].self, from: "pools.json")
    @State private var data1: String = "Loading Data 1..."
    @State private var data2: String = "Loading Data 2..."
    @State private var allDataLoaded: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
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
                Group {
                    VStack(spacing: 20) {
                        Text(data1)
                        Text(data2)
                        if allDataLoaded {
                            Text("All data loaded!")
                        }
                    }
                    .onAppear {
                        fetchData()
                    }
                }
            }
        }
        .navigationTitle(Text("Public Swimming Pools"))
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.blue) // Change the accent color for a fresh look
    }
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.data1 = "Data 1 Fetched!"
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            self.data2 = "Data 2 Fetched!"
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.allDataLoaded = true
        }
    }
    
}

struct PublicSwimmingPoolsView_Previews: PreviewProvider {
    
    static var previews: some View {
        PublicSwimmingPoolsView()
    }
}
