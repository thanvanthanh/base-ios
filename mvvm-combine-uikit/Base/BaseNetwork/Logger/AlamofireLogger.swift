//
//  AlamofireLogger.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 29/08/2023.
//

import Foundation
import Alamofire

final class AlamofireLogger: EventMonitor {
    
    func requestDidResume(_ request: Request) {
        let allHeaders = request.request.flatMap { $0.allHTTPHeaderFields.map { $0.description} } ?? "None"
        let headers = """
        ⚡️⚡️⚡️⚡️ Request Started: \(request)
        ⚡️⚡️⚡️⚡️ Headers: \(allHeaders)
        """
        
        NSLog(headers)
        
        let body = request.request.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "None"
        let message = """
        ⚡️⚡️⚡️⚡️ Request Started: \(request)
        ⚡️⚡️⚡️⚡️ Body Data: \(body)
        """
        
        NSLog(message)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        NSLog("⚡️⚡️⚡️⚡️ Response Receivedad: \(response.debugDescription)")
        if let body = response.data{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded";
            print("\n ℹ️ℹ️ℹ️ Response String: \(bodyString)\n")
        }
        NSLog("⚡️⚡️⚡️⚡️ Response All Headers: \(String(describing: response.response?.allHeaderFields))")
    }
}
