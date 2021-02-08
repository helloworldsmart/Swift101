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
      
      if database != nil {
        if database.open() {
          do {
            let createMoviesTableQuery = "create table movies (movieID integer primary key autoincrement not null, title text not null, category text not null, year integer not null, movieURL text, coverURL text not null, watched bool not null default 0, likes integer not null)"
  //          let createMoviesTableQuery = "create table movies (\(field_MovieID) integer primary key autoincrement not null, \(field_MovieTitle) text not null, \(field_MovieCategory) text not null, \(field_MovieYear) integer not null, \(field_MovieURL) text, \(field_MovieCoverURL) text not null, \(field_MovieWatched) bool not null default 0, \(field_MovieLikes) integer not null)"
            try database.executeUpdate(createMoviesTableQuery, values: nil)
            created = true
          } catch {
            print("Could not create table.")
            print(error.localizedDescription)
          }
          database.close()
        } else {
          print("Could not open the database.")
        }
      }
    }
    return created
  }
  
  func openDatabase() -> Bool {
    if database == nil {
      if FileManager.default.fileExists(atPath: pathToDatabase) {
        database = FMDatabase(path: pathToDatabase)
      }
    }
    
    if database != nil {
      if database.open() {
        return true
      }
    }
    return false
  }
  
}

