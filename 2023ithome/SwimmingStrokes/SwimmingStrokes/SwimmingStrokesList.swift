//
//  SwimmingStrokesList.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/9/24.
//

import SwiftUI

struct SwimmingStrokesList: View {
    @State private var showLineSeparator = true

    var body: some View {
        List {
            ForEach(1..<5) { index in
                
                HStack {
                    Image("photo-\(index)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 50)
                        .cornerRadius(10)

                    Text("Photo #\(index)")
                        .bold()
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        print("Mark as favorite")
                    } label: {
                        Label("Favorite", systemImage: "star")
                    }
                    .tint(.yellow)
                    
                    Button {
                        print("Delete")
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Share")
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .tint(.green)
                }

            }
            .listRowSeparatorTint(.blue)
        }
        .listStyle(PlainListStyle())
    }
}

struct SwimmingStrokesList_Previews: PreviewProvider {
    static var previews: some View {
        SwimmingStrokesList()
    }
}
