//
//  Publisher+ErrorTracker.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 30/08/2023.
//

import Combine

typealias ErrorTracker = PassthroughSubject<Error, Never>

extension Publisher {
    func trackError(_ errorTracker: ErrorTracker) -> AnyPublisher<Output, Failure> {
        return handleEvents(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                errorTracker.send(error)
            }
        })
        .eraseToAnyPublisher()
    }
}
