//
//  SelfieStoreTest.swift
//  SelfiegramTests
//
//  Created by Michael on 2020/11/26.
//  Copyright © 2020 TheAvengers. All rights reserved.
//

import XCTest
@testable import Selfiegram
import UIKit

class SelfieStoreTest: XCTestCase {

    func createImage(text: String) -> UIImage {
      UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
      
      defer {
        UIGraphicsEndImageContext()
      }
      
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
      label.font = UIFont.systemFont(ofSize: 50)
      label.text = text
      
      label.drawHierarchy(in: label.frame, afterScreenUpdates: true)
      
      return UIGraphicsGetImageFromCurrentImageContext()!
    }
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
