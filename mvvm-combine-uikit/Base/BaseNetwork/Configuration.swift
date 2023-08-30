//
//  Configuration.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 28/08/2023.
//

import Foundation

enum BaseURLType {
    case production
    case staging
    
    var desc: String {
        
        switch self {
        case .production:
            return "https://api.github.com"
        case .staging:
            return "https://api.github.com"
        }
    }
}
