//
//  SwiftUI_TCAApp.swift
//  SwiftUI-TCA
//
//  Created by yumin on 6/11/25.
//

import ComposableArchitecture
import SwiftUI

@main
struct MyApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: MyApp.store)
        }
    }
}
