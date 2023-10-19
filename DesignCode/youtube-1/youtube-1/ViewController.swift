//
//  ViewController.swift
//  youtube-1
//
//  Created by Michael on 2023/10/17.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.youtube.com/embed/JsX2lsLxLBI")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

