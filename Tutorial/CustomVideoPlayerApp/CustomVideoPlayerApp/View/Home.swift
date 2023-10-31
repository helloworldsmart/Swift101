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
    @State private var isFinishedPlaying: Bool = false
    /// Video Seeker Properties
    @GestureState private var isDragging: Bool = false
    @State private var isSeeking: Bool = false
    @State private var progress: CGFloat = 0
    @State private var lastDraggedProgress: CGFloat = 0
    @State private var isObserverAdded: Bool = false
    /// Video Seeker Thumbnails
    @State private var thumbnailFrames: [UIImage] = []
    @State private var draggingImage: UIImage?
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
                        .overlay(content: {
                            HStack(spacing: 60) {
                                DoubleTapSeek {
                                    /// Seeking 15 sec Backward
                                    let seconds = player.currentTime().seconds - 15
                                    player.seek(to: .init(seconds: seconds, preferredTimescale: 1))
                                }
                                
                                DoubleTapSeek(isForward: true) {
                                    /// Seeking 15 sec Forward
                                    let seconds = player.currentTime().seconds + 15
                                    player.seek(to: .init(seconds: seconds, preferredTimescale: 1))
                                }
                            }
                        })
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                showPlayerControls.toggle()
                            }
                            
                            /// Timing Out Controls, Only If the Video is Playing
                            if isPlaying {
                                timeoutControls()
                            }
                        }
                        .overlay(alignment: .leading, content: {
                            SeekerThumbnailView(videoPlayerSize)
                        })
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
        .onAppear {
            guard !isObserverAdded else { return }
            /// Adding Observer to update seeker when the video is Playing
            player?.addPeriodicTimeObserver(forInterval: .init(seconds: 1, preferredTimescale: 1), queue: .main, using: { time in
                /// Calculating Video Progress
                if let currentPlayerItem = player?.currentItem {
                    let totalDuration = currentPlayerItem.duration.seconds
                    guard let currentDuration = player?.currentTime().seconds else { return }
                    
                    let calculatedProgress = currentDuration / totalDuration
                    
                    // MARK: the old approach
//                    progress = calculatedProgress
                    if !isSeeking {
                        progress = calculatedProgress
                        lastDraggedProgress = progress
                    }
                    
                    if calculatedProgress == 1 {
                        /// Video Finished Playing
                        isFinishedPlaying = true
                        isPlaying = false
                    }
                }
            })
            
            isObserverAdded = true
            /// Before Generating Thumbnails, Check if the Video is Loaded
            if player?.currentItem?.status == .readyToPlay {
                generateThumbnailFrames()
            }
        }
    }
    
    /// Dragging Thumbnail View
    @ViewBuilder
    func SeekerThumbnailView(_ videoSize: CGSize) -> some View {
        let thumbSize: CGSize = .init(width: 175, height: 100)
        ZStack {
            if let draggingImage {
                Image(uiImage: draggingImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: thumbSize.width, height: thumbSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(.white, lineWidth: 2)
                    }
            } else {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(.white, lineWidth: 2)
                    }
            }
        }
        .frame(width: thumbSize.width, height: thumbSize.height)
        .opacity(isDragging ? 1 : 0)
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
                /// Showing Drag Knob only When Dragging
                .scaleEffect(showPlayerControls || isDragging ? 1 : 0.001, anchor: progress * size.width > 15 ? .trailing: .leading)
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
                            /// Cancelling Existing Timeout Task
                            if let timeoutTask {
                                timeoutTask.cancel()
                            }
                            /// Calculating Progress
                            let translationX: CGFloat = value.translation.width
                            let calculatedProgress = (translationX / videoSize.width) + lastDraggedProgress
                            
                            progress = max(min(calculatedProgress, videoSize.width), 0)
                            isSeeking = true
                            
                            let dragIndex = Int(progress / 0.01)
                            /// Checking if FrameThumbnails Contains the Frame
                            if thumbnailFrames.indices.contains(dragIndex) {
                                draggingImage = thumbnailFrames[dragIndex]
                            }
                        })
                        .onEnded({ value in
                            /// Storing Last Know Progress
                            lastDraggedProgress = progress
                            /// Seeking Video To Dragged Time
                            if let currentPlayerItem = player?.currentItem {
                                let totalDuration = currentPlayerItem.duration.seconds
                                
                                player?.seek(to: .init(seconds: totalDuration * progress, preferredTimescale: 1))
                                
                                /// Re-Scheduling Timeout Task
                                if isPlaying {
                                    timeoutControls()
                                }
                                
                                /// Release With Slight Delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isSeeking = false
                                }
                            }
                        })
                )
                .offset(x: progress * videoSize.width > 15 ? -15 : 0 )
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
                if isFinishedPlaying {
                    /// Setting Video to Start and Playing Again
                    isFinishedPlaying = false
                    player?.seek(to: .zero)
                    progress = .zero
                    lastDraggedProgress = .zero
                }
                
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
                /// Changing Icon When Video was Finished Playing
                Image(systemName: isFinishedPlaying ? "arrow.clockwise" : (isPlaying ? "pause.fill" : "play.fill"))
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
        /// Hiding Controls When Dragging
        .opacity(showPlayerControls && !isDragging ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: showPlayerControls && !isDragging)
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
    
    /// Generating Thumbnail Frames
    func generateThumbnailFrames() {
        Task.detached {
            guard let asset = player?.currentItem?.asset else { return }
            let generator = AVAssetImageGenerator(asset: asset)
            generator.appliesPreferredTrackTransform = true
            /// Min Size
            generator.maximumSize = .init(width: 250, height: 250)
            
            do {
                let totalDuration = try await asset.load(.duration).seconds
                var frameTimes: [CMTime] = []
                /// Frame Timings
                /// 1/0.1 = 100 (Frames)
                for progress in stride(from: 0, to: 1, by: 0.01) {
                    let time = CMTime(seconds: progress * totalDuration, preferredTimescale: 1)
                    frameTimes.append(time)
                }
                
                /// Generating Frame Images
                for await result in generator.images(for: frameTimes) {
                    let cgImage = try result.image
                    /// Adding Frame Image
                    await MainActor.run(body: {
                        thumbnailFrames.append(UIImage(cgImage: cgImage))
                    })
                }
            } catch {
                print(error.localizedDescription)
            }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
