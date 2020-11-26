//
//  SelfieStore.swift
//  Selfiegram
//
//  Created by Michael on 2020/11/26.
//  Copyright © 2020 TheAvengers. All rights reserved.
//

import UIKit.UIImage

class Selfie: Codable {
  let created: Date
  
  let id: UUID
 
  var title = "New Selfie!"
  
  var image: UIImage? {
    get {
      return SelfieStore.shared.getImage(id: self.id)
    }
    set {
      try? SelfieStore.shared.setImage(id: self.id, image: newValue)
    }
  }
  
  init(title: String) {
    self.title = title
    
    self.created = Date()
    self.id = UUID()
  }
}

enum SelfieStoreError: Error {
  case cannotSaveImage(UIImage?)
}

final class SelfieStore {
  static let shared = SelfieStore()
  
  func getImage(id: UUID) -> UIImage? {
    return nil
  }
  
  func setImage(id: UUID, image: UIImage?) throws {
    throw SelfieStoreError.cannotSaveImage(image)
  }
  
  func listSelfies() throws -> [Selfie] {
    return []
  }
  
  func delete(selfie: Selfie) throws {
    throw SelfieStoreError.cannotSaveImage(nil)
  }
  
  func delete(id: UUID) throws {
    throw SelfieStoreError.cannotSaveImage(nil)
  }
  
  func load(id: UUID) -> Selfie? {
    return nil
  }
  
  func save(selfie: Selfie) throws {
    throw SelfieStoreError.cannotSaveImage(nil)
  }
  
}
