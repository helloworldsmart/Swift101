//
//  ContentView.swift
//  SwiftUIByExample
//
//  Created by Michael on 2023/2/5.
//

import SwiftUI

// Our observable object class
class GameSettings: ObservableObject {
    @Published var score = 0
}

// A view that expects to find a GameSettings object
// in the environment, and shows its score.
struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        Text("Score: \(settings.score)")
    }
}

// A view that creates the GameSettings objects,
// and places it into the environment for the
// NavigationView.
struct ContentView: View {
    @StateObject var settings = GameSettings()

    var body: some View {
        // NavigationStack
        NavigationView {
            VStack {
                // A button that writes to the environment settings
                Button("Increase Score") {
                    settings.score += 1
                }
                
                NavigationLink {
                    ScoreView()
                } label: {
                     Text("Show Detail View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(settings)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
