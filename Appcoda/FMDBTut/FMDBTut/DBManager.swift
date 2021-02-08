//
//  DBManager.swift
//  FMDBTut
//
//  Created by Michael on 2021/2/4.
//  Copyright © 2021 Appcoda. All rights reserved.
//

import UIKit

class DBManager: NSObject {
  static let shared: DBManager = DBManager()
  
  let databaseFileName = "database.sqlite"
  
  var pathToDatabase: String!
  
  var database: FMDatabase!
  
  override init() {
    super.init()

    let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
    pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
  }
  
  func createDatabase() -> Bool {
    var created = false
    
    if !FileManager.default.fileExists(atPath: pathToDatabase) {
      database = FMDatabase(path: pathToDatabase!)
    }
    return created
  }
  
}

