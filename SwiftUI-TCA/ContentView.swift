//
//  ContentView.swift
//  SwiftUI-TCA
//
//  Created by yumin on 6/12/25.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink("Basics") {
                        Demo(store: Store(initialState: Counter.State()) { Counter() }) { store in
                            CounterDemoView(store: store)
                        }
                    }
                } header: {
                  Text("Getting started")
                }
            }
            .navigationTitle("TCA")
        }
    }
}

/// This wrapper provides an "entry" point into an individual demo that can own a store.
struct Demo<State, Action, Content: View>: View {
  @SwiftUI.State var store: Store<State, Action>
  let content: (Store<State, Action>) -> Content

  init(
    store: Store<State, Action>,
    @ViewBuilder content: @escaping (Store<State, Action>) -> Content
  ) {
    self.store = store
    self.content = content
  }

  var body: some View {
    content(store)
  }
}

#Preview {
    ContentView()
}
