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
    var videoUrl: String = "https://rr3---sn-ipoxu-un5es.googlevideo.com/videoplayback?expire=1698433942&ei=Nrc7ZdGIHcnF7OsPicGJsAE&ip=122.116.86.63&id=o-AFEuuQdOSRcDnebR-JvBtkNEaV02NVppj74MH1DSGgm6&itag=22&source=youtube&requiressl=yes&mh=4u&mm=31%2C29&mn=sn-ipoxu-un5es%2Csn-un57sn7y&ms=au%2Crdu&mv=m&mvi=3&pl=23&initcwndbps=832500&vprv=1&mime=video%2Fmp4&cnr=14&ratebypass=yes&dur=1577.401&lmt=1590100971413549&mt=1698412148&fvip=1&fexp=24007246&beids=24350018&c=ANDROID_EMBEDDED_PLAYER&txp=6316222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AGM4YrMwRQIhAJenPOxq3Pr3B5kFMC4Zb5S4SRRQqTEIQ48IQ9pXzOx-AiAaz21klbM9vm8q1RoUZZDRfVekPtatyQ6iu2-4u-xuGw%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AK1ks_kwRAIgdv0FpnnTXD98ALimEBuXEHyUMh74VvBVaTmcKDJ0r4wCIE5X-lfi0-5zTPu3vN-OS52vmpJYHL3NvcIiAachYDeg"
    /// View Properties
    @State private var player: AVPlayer? = {
        /// 方案一
        if let bundle = Bundle.main.path(forResource: "Make a Promise to our Sacred Guardians  Tiaki  Care for New Zealand_1080p", ofType: "mp4") {
            return .init(url: URL(filePath: bundle))
        }
        
        /// 方案二
//        if let url = URL(string: "https://rr3---sn-ipoxu-un5es.googlevideo.com/videoplayback?expire=1698433942&ei=Nrc7ZdGIHcnF7OsPicGJsAE&ip=122.116.86.63&id=o-AFEuuQdOSRcDnebR-JvBtkNEaV02NVppj74MH1DSGgm6&itag=22&source=youtube&requiressl=yes&mh=4u&mm=31%2C29&mn=sn-ipoxu-un5es%2Csn-un57sn7y&ms=au%2Crdu&mv=m&mvi=3&pl=23&initcwndbps=832500&vprv=1&mime=video%2Fmp4&cnr=14&ratebypass=yes&dur=1577.401&lmt=1590100971413549&mt=1698412148&fvip=1&fexp=24007246&beids=24350018&c=ANDROID_EMBEDDED_PLAYER&txp=6316222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AGM4YrMwRQIhAJenPOxq3Pr3B5kFMC4Zb5S4SRRQqTEIQ48IQ9pXzOx-AiAaz21klbM9vm8q1RoUZZDRfVekPtatyQ6iu2-4u-xuGw%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AK1ks_kwRAIgdv0FpnnTXD98ALimEBuXEHyUMh74VvBVaTmcKDJ0r4wCIE5X-lfi0-5zTPu3vN-OS52vmpJYHL3NvcIiAachYDeg") {
//            return .init(url: url)
//        }
        
        return nil
    }()
    @State private var showPlayerControls: Bool = false
    @State private var isPlaying: Bool = false
    @State private var timeoutTask: DispatchWorkItem?
    /// Video Seeker Properties
    @GestureState private var isDragging: Bool = false
    @State private var progress: CGFloat = 0
    @State private var lastDraggedProgress: CGFloat = 0
    var body: some View {
        VStack(spacing: 0) {
            let videoPlayerSize: CGSize = .init(width: size.width, height: size.height / 3.5)
            
            /// Custom Video Player
            ZStack {
                if let player {
                    CustomVideoPlayer(player: player)
                        .overlay {
                            Rectangle()
                                .fill(.black.opacity(0.4))
                                .opacity(showPlayerControls || isDragging ? 1 : 0)
                                /// Animating Dragging State
                                .animation(.easeInOut(duration: 0.35), value: isDragging)
                                .overlay {
                                    PlayBackControls()
                                }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                showPlayerControls.toggle()
                            }
                            
                            /// Timing Out Controls, Only If the Video is Playing
                            if isPlaying {
                                timeoutControls()
                            }
                        }
                        .overlay(alignment: .bottom) {
                            VideoSeekerView(videoPlayerSize)
                        }
                }
            }
            .frame(width: videoPlayerSize.width, height: videoPlayerSize.height)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    // Thumb-unsplash-1
                    ForEach(1...5, id: \.self) { index in
                        GeometryReader {
                            let size = $0.size
                            
                            Image("Thumb-unsplash-\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        }
                        .frame(height: 220)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 30)
                .padding(.bottom, 15 + safeArea.bottom)
            }
        }
        .padding(.top, safeArea.top)
    }
    
    /// Video Seeker View
    @ViewBuilder
    func VideoSeekerView(_ videoSize: CGSize) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.gray)
            
            Rectangle()
                .fill(.red)
                .frame(width: max(size.width * progress, 0))
        }
        .frame(height: 3)
        .overlay(alignment: .leading) {
            Circle()
                .fill(.red)
                .frame(width: 15, height: 15)
                /// For More Dragging Space
                .frame(width: 50, height: 50)
                .contentShape(Rectangle())
                /// Moving Along Side With Gesture Progress
                .offset(x: size.width * progress)
                .gesture(
                    DragGesture()
                        .updating($isDragging, body: { _, out, _ in
                            out = true
                        })
                        .onChanged({ value in
                            /// Calculating Progress
                            let translationX: CGFloat = value.translation.width
                            let calculatedProgress = (translationX / videoSize.width) + lastDraggedProgress
                            
                            progress = max(min(calculatedProgress, videoSize.width), 0)
                        })
                        .onEnded({ value in
                            /// Storing Last Know Progress
                            lastDraggedProgress = progress
                            /// Seeking Video To Dragged Time
                            if let currentPlayerItem = player?.currentItem {
                                let totalDuration = currentPlayerItem.duration.seconds
                                
                                player?.seek(to: .init(seconds: totalDuration * progress, preferredTimescale: 1))
                            }
                        })
                )
                .frame(width: 15, height: 15)
        }
    }
    
    /// Playback Controls View
    @ViewBuilder
    func PlayBackControls() -> some View {
        HStack(spacing: 25) {
            Button {
                
            } label: {
                Image(systemName: "backward.end.fill")
                    .font(.title2)
                    .fontWeight(.ultraLight)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
            /// Disabling Button
            /// Since we have no action's for it
            .disabled(true)
            .opacity(0.6)

            
            Button {
                ///Changing Video Status to Play/Pause based on user input
                if isPlaying {
                    /// Pause Video
                    player?.pause()
                    /// Cancelling Timeout Task when the Video is Paused
                    if let timeoutTask {
                        timeoutTask.cancel()
                    }
                } else {
                    /// Play Video
                    player?.play()
                    timeoutControls()
                }
                
                withAnimation(.easeInOut(duration: 0.2)) {
                    isPlaying.toggle()
                }
            } label: {
                /// Changing Icon based on Video Status
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
            .scaleEffect(1.1)
            
            Button {
                
            } label: {
                Image(systemName: "forward.end.fill")
                    .font(.title2)
                    .fontWeight(.ultraLight)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
             .disabled(true)
            .opacity(0.6)
            
        }
        .opacity(showPlayerControls ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: showPlayerControls)
    }
    
    /// Timing Out Play back controls
    /// After some 2-5 Second
    func timeoutControls() {
        /// Cancelling Already Pending Timeout Task
        if let timeoutTask {
            timeoutTask.cancel()
        }
        
        timeoutTask = .init(block: {
            withAnimation(.easeInOut(duration: 0.35)) {
                showPlayerControls = false
            }
        })
        
        /// Scheduling Task
        if let timeoutTask {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: timeoutTask)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
