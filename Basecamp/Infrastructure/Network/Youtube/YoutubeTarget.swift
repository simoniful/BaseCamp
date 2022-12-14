//
//  YoutubeTarget.swift
//  Basecamp
//
//  Created by Sang hun Lee on 2022/12/20.
//

import Foundation
import Moya

enum YoutubeTarget {
  case getYoutube(parameters: DictionaryType)
}

extension YoutubeTarget: TargetType {
  var baseURL: URL {
    guard let url = URL(string: YoutubeAPIConstant.environment.rawValue) else {
        fatalError("Fatal error - invalid youtube API url")
    }
    return url
  }
  
  var path: String {
    switch self {
    case .getYoutube:
      return "/search"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case.getYoutube:
      return .get
    }
  }
  
  var sampleData: Data {
    return stubData(self)
  }
  
  var task: Task {
    switch self {
    case .getYoutube(let parameters):
      return .requestParameters(
        parameters: parameters,
        encoding: URLEncoding.default
      )
    }
  }
  
  var validationType: ValidationType {
      return .customCodes([200])
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
}
