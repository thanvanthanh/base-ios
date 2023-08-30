//
//  APIRouter.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 28/08/2023.
//

import Foundation
import Alamofire

enum APIRouter {
    case search(username: String)
}

extension APIRouter: TargetType {
    var baseUrl: BaseURLType {
        return .staging
    }
    
    var path: RequestType {
        switch self {
        case .search:
            return .requestPath(path: "/search/users")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .search(username):
            return .requestParameters(parameters: ["q": username], encoding:JSONEncoding.default)
        }
    }
    
    var header: [String : String]? {
        switch self {
        default :
            return ["Content-Type":"application/json",
                    "accept":"application/json"]
        }
    }
    
    
}
