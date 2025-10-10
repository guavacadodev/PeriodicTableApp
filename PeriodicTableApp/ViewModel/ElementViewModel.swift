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
    
    init() {
        loadElements()
    }
    
    private func loadElements() {
        print("DEBUG: Attempting to load elements.json...")
        
        guard let url = Bundle.main.url(forResource: "elements", withExtension: "json") else {
            print("DEBUG: elements.json could not be found in project bundle.")
            print("DEBUG: Bundle path: \(Bundle.main.bundlePath)")
            return
        }
        
        print("DEBUG: Found elements.json at: \(url.path)")
        
        do {
            // Try to decode the data from the json and set it to decoded constant
            let data = try Data(contentsOf: url)
            print("DEBUG: Loaded data: \(data.count) bytes")
            
            // Decode the root object that contains the elements array
            struct ElementsWrapper: Codable {
                let elements: [ElementModel]
            }
            
            let decoder = JSONDecoder()
            let wrapper = try decoder.decode(ElementsWrapper.self, from: data)
            
            print("DEBUG: Successfully decoded \(wrapper.elements.count) elements")
            
            // Sort elements by atomic number for grid or list use
            self.elements = wrapper.elements.sorted { $0.atomicNumber < $1.atomicNumber }
            
            // Build quick lookups
            self.byAtomicNumber = Dictionary(uniqueKeysWithValues: elements.map { ($0.atomicNumber, $0) })
            self.bySymbol = Dictionary(uniqueKeysWithValues: elements.map { ($0.symbol, $0) })
            
            print("DEBUG: Loaded \(elements.count) elements successfully!")
            
            // Debug: Check if bohrModelImage URLs are being loaded
            if let firstElement = elements.first {
                print("DEBUG: First element (\(firstElement.symbol)) bohrModelImage: \(firstElement.bohrModelImage ?? "nil")")
            }
        } catch let DecodingError.keyNotFound(key, context) {
            print("DEBUG: Decoding Error: Key '\(key.stringValue)' not found")
            print("   Context: \(context.debugDescription)")
            print("   Coding Path: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("❌ Decoding Error: Type mismatch for type \(type)")
            print("   Context: \(context.debugDescription)")
            print("   Coding Path: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(type, context) {
            print("❌ Decoding Error: Value not found for type \(type)")
            print("   Context: \(context.debugDescription)")
            print("   Coding Path: \(context.codingPath)")
        } catch {
            print("❌ Error decoding elements.json: \(error)")
            print("   Error details: \(error.localizedDescription)")
        }
    }
}

