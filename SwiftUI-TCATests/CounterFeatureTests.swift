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
    func timer() async {
        let clock = TestClock()
        
        
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.continuousClock = clock
        }
        
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = true
        }
        await clock.advance(by: .seconds(1))
        await store.receive(\.timerTick) {
            $0.count = 1
        }
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = false
        }
    }
}
