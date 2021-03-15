//
//  ParameterEncoding.swift
//  NetworkLayer
//
//  Created by Michael on 2021/3/15.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
  static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError : String, Error {
  case parametersNil = "Parameters were nil."
  case encodingFailed = "Parameter encoding failed."
  case missingURL = "URL is nil."
}
