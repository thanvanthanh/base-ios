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
    case refreshToken(token: String)
}

extension APIRouter: TargetType {
    var baseUrl: BaseURLType {
        return .staging
    }
    
    var path: RequestType {
        switch self {
        case .search:
            return .requestPath(path: "/search/users")
        case .refreshToken:
            return .requestPath(path: "/auth/refresh")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        case .refreshToken:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .search(username):
            return .requestParameters(parameters: ["q": username], encoding:JSONEncoding.default)
        case let .refreshToken(token):
            return .requestParameters(parameters: ["refresh_token": token], encoding: .default)
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
