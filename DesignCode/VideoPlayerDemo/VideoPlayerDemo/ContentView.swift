//
//  ContentView.swift
//  VideoPlayerDemo
//
//  Created by Michael on 2023/10/17.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var player = AVPlayer()
    var videoUrl: String = "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player = AVPlayer(url: URL(string: videoUrl)!)
            }
    }
}

//import UIKit
//import WebKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var webView: WKWebView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let url = URL(string: "https://www.youtube.com/embed/JsX2lsLxLBI")!
//        let request = URLRequest(url: url)
//        webView.load(request)
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
