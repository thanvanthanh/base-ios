//
//  BaseViewModel.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 30/08/2023.
//

import Foundation
import Combine

class BaseViewModel: NSObject {
    let error = ErrorTracker()
    
    let isLoading = CurrentValueSubject<Bool, Never>(false)
    
    override init() {
        super.init()
    }
}

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input, _ disposeBag: DisposeBag) -> Output
}
