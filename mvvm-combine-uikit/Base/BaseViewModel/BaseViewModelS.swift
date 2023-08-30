//
//  BaseViewModel.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 29/08/2023.
//

import Foundation
import Combine

enum ViewModelStatus: Equatable {
    case load
    case dismissLoading
    case error(String)
}

protocol ViewModelBaseProtocol {
    var loadingState: CurrentValueSubject<ViewModelStatus, Never> { get }
    var subscriber: Set<AnyCancellable> { get }
}

// SearchViewModel
typealias searchViewModel = ViewModelBaseProtocol & SearchViewModelBaseProtocol

protocol SearchViewModelBaseProtocol {
    func callSearchService(username: String)
}
