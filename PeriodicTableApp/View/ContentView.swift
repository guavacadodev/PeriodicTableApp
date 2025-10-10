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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(elementVM.elements, id: \.atomicNumber) { element in
                    ZStack(alignment: .top) {
                        Rectangle()
                            .foregroundStyle(.black)
                            .background(.red)
                            .cornerRadius(20)
                        HStack {
                            Text(element.atomicNumber.description)
                            Spacer()
                            Text(element.atomicMass.description)
                        }
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        Text(element.symbol)
                            .foregroundStyle(.white)
                            .padding()
                            .font(.title2)
                            .fontWeight(.medium)
                        VStack {
                            Image("titanium")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        .foregroundStyle(.white)
                        .padding()
                        Text(element.name)
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .padding()
                    }
                    .frame(width: 300, height: 300)
                }
            }
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
