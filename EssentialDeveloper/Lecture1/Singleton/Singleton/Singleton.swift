//
//  Singleton.swift
//  Singleton
//
//  Created by Michael on 2021/4/12.
//

import Foundation
import UIKit

// Main Module

extension ApiClient {
  func login(completion: (LoggedInUser) -> Void) {}
}

extension ApiClient {
  func loadFeed(completion: ([FeedItem]) -> Void) {}
}


// Api Module

class ApiClient {
  static let shared = ApiClient()
  
  func execute(_ : URLRequest, completion: (Data) -> Void) {}
}


// Login Module
struct LoggedInUser {}

class LoginViewController: UIViewController {
  var login: (((LoggedInUser) -> Void) -> Void)?
  
  func didTapLoginButton() {
    login? { user in
      // show feed screen
    }
  }
}

// Feed Module

struct FeedItem {}

class  FeedViewController: UIViewController {
  var loadFeed: ((([FeedItem]) -> Void) -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadFeed? { loadedItems in
      //update UI
    }
  }
}
