/// Copyright (c) 2023 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import Moya
import UIKit

public enum Imgur {
  // 1
  private static let clientId = "YOUR CLIENT ID"
  
  // 2
  case upload(UIImage)
  case delete(String)
}

extension Imgur: TargetType {
  // 1
  public var baseURL: URL {
    return URL(string: "https://api.imgur.com/3")!
  }
  
  // 2
  public var path: String {
    switch self {
    case .upload: return "/image"
    case .delete(let deletehash): return "/image/\(deletehash)"
    }
  }
  
  // 3
  public var method: Moya.Method {
    switch self {
    case .upload: return .post
    case .delete: return .delete
    }
  }
  
  // 4
  public var sampleData: Data {
    return Data()
  }
  
  // 5
  public var task: Moya.Task {
    switch self {
    case .upload(let image):
      let imageData = image.jpegData(compressionQuality: 10)!
      
      return .uploadMultipart([MultipartFormData(provider: .data(imageData),
                                                 name: "image",
                                                 fileName: "card.jpg",
                                                 mimeType: "image/jpg")])
    case .delete:
      return .requestPlain
    }
  }
  
  // 6
  public var headers: [String: String]? {
    return [
      "Authorization": "Client-ID \(Imgur.clientId)",
      "Content-Type": "application/json"
    ]
  }
  
  // 7
  public var validationType: ValidationType {
    return .successCodes
  }
}
