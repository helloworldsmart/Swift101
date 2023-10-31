//
//  CMTime+Extensions.swift
//  CustomVideoPlayerApp
//
//  Created by Michael on 2023/10/31.
//

import SwiftUI
import AVKit

extension CMTime {
    func toTimeString() -> String {
        let roundedSeconds = seconds.rounded()
        let hours: Int = Int(roundedSeconds / 3600)
        let min: Int = Int(roundedSeconds.truncatingRemainder(dividingBy: 3600 / 60))
        let sec: Int = Int(roundedSeconds / 60)
        
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, min, sec)
        }
        
        return String(format: "%02d:%02d", min, sec)
    }
}
