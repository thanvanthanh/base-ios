//
//  SearchViewModel.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 30/08/2023.
//

import Combine
import Foundation

class SearchViewModel: BaseViewModel {
    let getSearchData: SearchServiceProtocol
    
    init(getSearchData: SearchServiceProtocol) {
        self.getSearchData = getSearchData
    }
}

extension SearchViewModel: ViewModelType {
    struct Input {
        let searchTrigger: AnyPublisher<String, Never>
        let selectUserTrigger: AnyPublisher<IndexPath, Never>
    }
    
    final class Output: ObservableObject {
        @Published var response: ItemSearchResponse?
        @Published var isLoading = false
        @Published var error: Error?
    }
    
    func transform(_ input: Input, _ disposeBag: DisposeBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        input.searchTrigger
            .flatMap {
                self.getSearchData
                    .search(username: $0)
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
                    .catch { _ in
                        Empty()
                    }
                    .eraseToAnyPublisher()
            }
            .assign(to: \.response, on: output)
            .store(in: disposeBag)
        
        input.selectUserTrigger
            .sink {
                let user = output.response?.items?[$0.row]
                DetailViewCoordinator.shared.start(data: user)
            }
            .store(in: disposeBag)
        
        activityTracker
            .assign(to: \.isLoading, on: output)
            .store(in: disposeBag)
        
        
        return output
    }
}
