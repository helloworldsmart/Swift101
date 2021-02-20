//
//  ViewController.swift
//  layers
//
//  Created by Pikachu on 2/20/21.
//  Copyright © 2021 Pikachu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet private var box: UIView!
  @IBOutlet weak var touchMe: UIButton!

  override func viewDidLoad() {
      view.backgroundColor = UIColor(red: 241.0/255.0, green: 239.0/255.0, blue: 227.0/255, alpha: 1.0)
    touchMe.layer.cornerRadius = 20;
      box.layer.cornerRadius = 120;
      // Error: CGSizeMake is unavailable in swift
      // A: https://stackoverflow.com/questions/48441523/what-is-an-alternative-for-cgsizemake-in-swift-3-0
      box.layer.shadowOffset = CGSize(width: 5, height: 5)
      box.layer.shadowOpacity = 0.7
      box.layer.shadowRadius = 5
      box.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
      
      box.layer.borderColor = UIColor.yellow.cgColor;
      box.layer.borderWidth = 10;
      
      box.layer.contents = UIImage(named: "Pikachu.jpg")?.cgImage
      box.layer.contentsGravity = CALayerContentsGravity.resize
      box.layer.masksToBounds = true
      
      // MARK: Change to Swift5 以下要修正
      // yellow() -> yellow
      // CGColor -> cgColor
      // CGImage -> cgImage
      // kCAGravityResize -> CALayerContentsGravity.resize
      
    }
}
