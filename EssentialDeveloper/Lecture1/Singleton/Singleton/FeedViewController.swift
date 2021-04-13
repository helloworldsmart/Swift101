//
//  FeedViewController.swift
//  Singleton
//
//  Created by Michael on 2021/4/13.
//

import Foundation
import UIKit

protocol FeedLoader {
  func loadFeed(completion: @escaping ([String]) -> Void)
}

class FeedViewController2: UIViewController {
  var remote: RemoteFeedLoader!
  var local: LocalFeedLoader!
  
  convenience init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
    self.init()
    self.remote = remote
    self.local = local
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if Reachability.networkAvailable {
      remote.loadFeed { loadedItems in
        <#code#>
      }
    } else {
      local.loadFeed { (lo) in
          <#code#>
      }
    }
    
  }
}

class RemoteFeedLoader: FeedLoader {
  func loadFeed(completion: @escaping ([String]) -> Void) {
    // do something
  }
}

class LocalFeedLoader: FeedLoader {
  func loadFeed(completion: @escaping ([String]) -> Void) {
    // do something
  }
}

struct Reachability {
  static let networkAvailable = false
}

class RemoteWithLocalFallbackFeedService: FeedLoader {
  let remote: RemoteFeedLoader
  let local: LocalFeedLoader
  
  init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
    self.remote = remote
    self.local = local
  }
  
  func loadFeed(completion: @escaping ([String]) -> Void) {
    
    let load = Reachability.networkAvailable ?
      remote.loadFeed : local.loadFeed
    
    load(completion)
  }
}

// TODO: bug
//let vc = FeedViewController2(loader: RemoteFeedLoader())
//let vc2 = FeedViewController2(
