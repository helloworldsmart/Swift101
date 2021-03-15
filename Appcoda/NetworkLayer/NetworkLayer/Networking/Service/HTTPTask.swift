//
//  HTTPTask.swift
//  NetworkLayer
//
//  Created by Michael on 2021/3/15.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
  case request
  
  case requestParameters(bodyParameters: Parameter?, urlParameters: Parameter?)
  
  case requestParametersAndHeaders(bodyParameters: Parameter?, urlParameters: Parameter?, additionHeaders: HTTPHeaders?)
  
  // case download, upload ... etc
  
}
