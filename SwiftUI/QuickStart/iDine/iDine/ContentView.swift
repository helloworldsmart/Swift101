//
//  ContentView.swift
//  iDine
//
//  Created by Michael on 2022/12/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    // MARK: error build: Cannot find 'NavigationStack' in scope
//        NavigationStack
        NavigationView {
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            .navigationTitle("Menu")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
