//
//  ElementViewModel.swift
//  PeriodicTableApp
//
//  Created by Jake Woodall on 10/7/25.
//

import SwiftUI

final class ElementStore: ObservableObject {
    static let shared = ElementStore()   // optional singleton
    
    @Published private(set) var elements: [ElementModel] = []
    private(set) var byAtomicNumber: [Int: ElementModel] = [:]
    private(set) var bySymbol: [String: ElementModel] = [:]
    
    private init() {
        loadElements()
    }
    
    private func loadElements() {
        guard
            let url = Bundle.main.url(forResource: "elements", withExtension: "json")
        else {
            print("elements.json could not be found in project.")
            return
        }
        
        do {
            // Try to decode the data from the json and set it to decoded constant
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([ElementModel].self, from: data)
            
            // Sort elements by atomic number for grid or list use
            self.elements = decoded.sorted { $0.atomicNumber < $1.atomicNumber }
            
            // Build quick lookups
            self.byAtomicNumber = Dictionary(uniqueKeysWithValues: elements.map { ($0.atomicNumber, $0) })
            self.bySymbol = Dictionary(uniqueKeysWithValues: elements.map { ($0.symbol, $0) })
            
            print("✅ Loaded \(elements.count) elements.")
        } catch {
            print("⚠️ Error decoding elements.json: \(error)")
        }
    }
}

