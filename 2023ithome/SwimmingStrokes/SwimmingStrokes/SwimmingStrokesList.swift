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
            ForEach(1..<8) { index in
                Image("photo-\(index)")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            .listRowSeparator(.hidden, edges: .bottom)
        }
        .listStyle(PlainListStyle())
    }
}

struct SwimmingStrokesList_Previews: PreviewProvider {
    static var previews: some View {
        SwimmingStrokesList()
    }
}
