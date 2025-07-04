//
//  SwiftUI_TCATests.swift
//  SwiftUI-TCATests
//
//  Created by yumin on 6/14/25.
//

import ComposableArchitecture
import Testing

@testable import SwiftUI_TCA

@MainActor
struct CounterFeatureTests {
    @Test
    func numberFact() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.numberFact.fetch = { "\($0) is a good number." }
        }
        
        await store.send(.factButtonTapped) {
            $0.isLoading = true
        }
        await store.receive(\.factResponse) {
            $0.isLoading = false
            $0.fact = "0 is a good number."
        }
    }
}
