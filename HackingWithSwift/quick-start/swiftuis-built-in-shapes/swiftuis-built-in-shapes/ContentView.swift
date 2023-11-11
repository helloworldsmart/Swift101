//
//  ContentView.swift
//  swiftuis-built-in-shapes
//
//  Created by Michael on 2023/11/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)

            RoundedRectangle(cornerRadius: 25)
                .fill(.red)
                .frame(width: 200, height: 200)

//            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
//                .fill(.orange)
//                .frame(width: 200, height: 200)
            Capsule()
                .fill(.green)
                .frame(width: 100, height: 50)
            Ellipse()
                .fill(.blue)
                .frame(width: 100, height: 50)
            Circle()
                .fill(.white)
                .frame(width: 100, height: 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
