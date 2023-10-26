//
//  CustomVideoPlayer.swift
//  CustomVideoPlayerApp
//
//  Created by Michael on 2023/10/26.
//

import SwiftUI
import AVKit

/// Custom Video Player
struct CustomVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
    func makeUIViewController(context: Context) -> some AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

