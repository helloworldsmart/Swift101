//
//  ViewController.swift
//  GCDSamples
//
//  Created by Pikachu on 02/24/21.
//  Copyright © 2021 Pikachu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//         simpleQueues()
        
//         queuesWithQoS()
        
        /*
         concurrentQueues()
         if let queue = inactiveQueue {
            queue.activate()
         }
        */
        
//         queueWithDelay()
        
//         fetchImage()
        
         useWorkItem()
    }
    
    
    
    func simpleQueues() {
      let queue = DispatchQueue(label: "com.appcoda.myqueue")
      queue.async {
        for i in 0..<10 {
          print("🔴 ", i)
        }
      }
      
      for i in 100..<110 {
        print("🏄🏻", i)
      }
    }
    
    
    func queuesWithQoS() {
      let queue1 = DispatchQueue(label: "com.appcoda.queue1", qos: DispatchQoS.userInitiated)
      let queue2 = DispatchQueue(label: "com.appcoda.queue2", qos: DispatchQoS.userInitiated)
      
      queue1.async {
        for i in 0..<10 {
          print("🔴", i)
        }
      }
      
      queue2.async {
        for i in 100..<110 {
          print("🔵", i)
        }
      }
      
      for i in 1000..<1010 {
        print("🔶", i)
      }
      
    }
    
    
    var inactiveQueue: DispatchQueue!
    func concurrentQueues() {
//      let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility)
//      let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .concurrent)
//      let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .initiallyInactive)
      let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: [.concurrent, .initiallyInactive])
      inactiveQueue = anotherQueue
      anotherQueue.async {
        for i in 0..<10 {
          print("🔴", i)
        }
      }
      
      anotherQueue.async {
        for i in 100..<110 {
          print("🔵", i)
        }
      }

      anotherQueue.async {
        for i in 1000..<1010 {
          print("🟣", i)
        }
      }
    }
    
    
    func queueWithDelay() {
      let delayQueue = DispatchQueue(label: "com.appcoda.delayqueue", qos: .userInitiated)
      print(Date())
      let additionalTime: DispatchTimeInterval = .seconds(2)
      
      delayQueue.asyncAfter(deadline: .now() + additionalTime) {
        print(Date())
      }
    }
    
    
    func fetchImage() {
//      let globalQueue = DispatchQueue.global()
//      globalQueue.async {
//        for i in 0..<10 {
//          print("🔴", i)
//        }
//      }
      let imageURL: URL = URL(string: "https://pyxis.nymag.com/v1/imgs/217/c68/2150b3cdeb721f8d13997c2730bb12399c-08-detective-pikachu-review.rsquare.w1200.jpg")!
      (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL, completionHandler: {(imageData, response, error) in
        if let data = imageData {
          print("Did download image data")
          // UIImageView.image must be used from main thread only
//          self.imageView.image = UIImage(data: data)

          DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
          }
        }
      }).resume()
    }
  
    func useWorkItem() {
      var value = 10
      
      let workItem = DispatchWorkItem {
        value += 5
      }
      
      workItem.perform()
      let queue = DispatchQueue.global(qos: .utility)
//      queue.async {
//        workItem.perform()
//      }
      queue.async(execute: workItem)
      
      workItem.notify(queue: DispatchQueue.main) {
        print("value = ", value)
      }
      
    }
}

