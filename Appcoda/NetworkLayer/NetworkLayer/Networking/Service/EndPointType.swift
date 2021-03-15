//
//  EndPointType.swift
//  NetworkLayer
//
//  Created by Michael on 2021/3/15.
//

import Foundation

protocol EndPointType {
  var baseURL: URL { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var task: HTTPTask { get }
  var headers: HTTPHeaders? { get }
}

