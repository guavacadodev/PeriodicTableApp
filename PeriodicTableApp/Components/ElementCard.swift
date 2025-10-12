//
//  ElementCard.swift
//  PeriodicTableApp
//
//  Created by Jake Woodall on 10/11/25.
//

import SwiftUI

struct ElementCard: View {
    @ObservedObject var elementVM: ElementStore
    let element: ElementModel
    var body: some View {
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
                if let urlString = element.bohrModelImage,
                   let url = URL(string: urlString) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 150, height: 150)
                                .onAppear {
                                    print("⏳ Loading image for \(element.symbol): \(urlString)")
                                }
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .onAppear {
                                    print("✅ Successfully loaded image for \(element.symbol)")
                                }
                        case .failure(let error):
                            Image(systemName: "atom")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.gray.opacity(0.5))
                                .onAppear {
                                    print("❌ Failed to load image for \(element.symbol): \(error)")
                                    print("   URL was: \(urlString)")
                                }
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Image(systemName: "atom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray.opacity(0.5))
                        .onAppear {
                            print("⚠️ No bohrModelImage URL for \(element.symbol)")
                        }
                }
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
