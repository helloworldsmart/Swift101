//
//  File.swift
//  
//
//  Created by Michael on 2022/12/27.
//

import Foundation

public class ContentViewModel: ObservableObject {
  @Published public var hellos = 0
  public init() {}
  public func hello() {
    hellos += 1
  }
}
