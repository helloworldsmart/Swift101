//
//  ContentView.swift
//  VideoPlayerDemo
//
//  Created by Michael on 2023/10/17.
//

import SwiftUI
import AVKit

//struct ContentView: View {
//    @State var player = AVPlayer()
//    var videoUrl: String = "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"
//    var body: some View {
//        VideoPlayer(player: player)
//            .onAppear() {
//                player = AVPlayer(url: URL(string: videoUrl)!)
//            }
//    }
//}


struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Query.allCases, id: \.self) { searchQuery in
                    QueryTag(query: searchQuery, isSelected: false)
                }
            }
            
            ScrollView {
                VideoCard(video: previewVideo)
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color("AccentColor"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
