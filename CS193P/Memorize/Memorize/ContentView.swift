//
//  ContentView.swift
//  Memorize
//
//  Created by Michael on 2021/3/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      return ZStack(content: {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
        Text("👻")
      })
      .padding()
      .foregroundColor(Color.orange)
      .font(Font.largeTitle)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
