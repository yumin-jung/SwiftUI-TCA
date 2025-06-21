//
//  AppFeatureTests.swift
//  SwiftUI-TCATests
//
//  Created by yumin on 6/21/25.
//

import ComposableArchitecture
import Testing

@testable import SwiftUI_TCA

@MainActor
struct AppFeatureTests {
    @Test
    func incrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
        }
    }
}
