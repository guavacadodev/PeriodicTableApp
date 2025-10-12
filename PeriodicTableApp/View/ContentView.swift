//
//  ContentView.swift
//  PeriodicTableApp
//
//  Created by Jake Woodall on 10/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var elementVM = ElementStore()
    var body: some View {
        VStack {
            Text("Loaded \(elementVM.elements.count) elements")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            if elementVM.elements.isEmpty {
                Text("No elements loaded. Check Xcode console for errors.")
                    .foregroundColor(.red)
                    .padding()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(elementVM.elements, id: \.atomicNumber) { element in
                        ElementCard(elementVM: elementVM, element: element)
                    }
                }
            }
            .padding()
        }
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
