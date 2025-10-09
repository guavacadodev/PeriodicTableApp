//
//  ContentView.swift
//  PeriodicTableApp
//
//  Created by Jake Woodall on 10/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct Element: View {
    var body: some View {
        Text("")
    }
}

#Preview {
    ContentView()
}
