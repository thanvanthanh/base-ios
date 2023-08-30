//
//  Publisher+ActivityTracker.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 30/08/2023.
//

import Combine

typealias ActivityTracker = CurrentValueSubject<Bool, Never>

extension Publisher {
    func trackActivity(_ activityTracker: ActivityTracker) -> AnyPublisher<Output, Failure> {
        return handleEvents(receiveSubscription: { _ in
            activityTracker.send(true)
        }, receiveCompletion: { _ in
            activityTracker.send(false)
        })
        .eraseToAnyPublisher()
    }
}
