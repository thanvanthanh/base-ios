//
//  AFNetworking.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 29/08/2023.
//

import Alamofire


final class AFNetworking {
    let session: Session
    
    required init(allHostsMustBeEvaluated: Bool) {
        session = Session.init(eventMonitors: [AlamofireLogger()])
    }
}
