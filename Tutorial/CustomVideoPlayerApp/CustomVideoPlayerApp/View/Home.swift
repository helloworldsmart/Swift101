//
//  Home.swift
//  CustomVideoPlayerApp
//
//  Created by Michael on 2023/10/26.
//

import SwiftUI
import AVKit

struct Home: View {
    var size: CGSize
    var safeArea: EdgeInsets
    /// View Properties
    @State private var player: AVPlayer? = {
        if let bundle = Bundle.main.path(forResource: "Make a Promise to our Sacred Guardians  Tiaki  Care for New Zealand_1080p", ofType: "mp4") {
            return .init(url: URL(filePath: bundle))
        }
        
        return nil
    }()
    
    var body: some View {
        VStack(spacing: 0) {
            let videoPlayerSize: CGSize = .init(width: size.width, height: size.height / 3.5)
            
            /// Custom Video Player
            ZStack {
                if let player {
                    CustomVideoPlayer(player: player)
                }
            }
            .frame(width: videoPlayerSize.width, height: videoPlayerSize.height)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    
                }
            }
        }
        .padding(.top, safeArea.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
