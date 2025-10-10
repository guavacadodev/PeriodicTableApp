//
//  ElementModel.swift
//  PeriodicTableApp
//
//  Created by Jake Woodall on 10/7/25.
//

import Foundation

struct ElementModel: Identifiable, Codable, Hashable {
    var id: Int { atomicNumber }
    var name: String
    var symbol: String
    var atomicNumber: Int
    var atomicMass: Double
    var elementCategory: ElementCategory
    var phase: Phase
    let yearDiscovered: Int?
    let discoveredBy: String?
    let colorHex: String?
    let bohrModelImage: String?
    /*
     add more properties later such as
     - boiling point
     - electonegativity ...
     */
    
    enum CodingKeys: String, CodingKey {
        case name
        case symbol
        case atomicNumber
        case atomicMass
        case elementCategory
        case phase
        case yearDiscovered
        case discoveredBy
        case colorHex
        case bohrModelImage
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        symbol = try container.decode(String.self, forKey: .symbol)
        atomicNumber = try container.decode(Int.self, forKey: .atomicNumber)
        atomicMass = try container.decode(Double.self, forKey: .atomicMass)
        elementCategory = try container.decode(ElementCategory.self, forKey: .elementCategory)
        phase = try container.decode(Phase.self, forKey: .phase)
        yearDiscovered = try? container.decode(Int.self, forKey: .yearDiscovered)
        discoveredBy = try? container.decode(String.self, forKey: .discoveredBy)
        colorHex = try? container.decode(String.self, forKey: .colorHex)
        bohrModelImage = try? container.decode(String.self, forKey: .bohrModelImage)
    }
    
    init(name: String, symbol: String, atomicNumber: Int, atomicMass: Double, 
         elementCategory: ElementCategory, phase: Phase, yearDiscovered: Int?, 
    discoveredBy: String?, colorHex: String?, bohrModelImage: String?) {
        self.name = name
        self.symbol = symbol
        self.atomicNumber = atomicNumber
        self.atomicMass = atomicMass
        self.elementCategory = elementCategory
        self.phase = phase
        self.yearDiscovered = yearDiscovered
        self.discoveredBy = discoveredBy
        self.colorHex = colorHex
        self.bohrModelImage = bohrModelImage
    }
    
}

enum ElementCategory: String, Codable {
    case diatomicNonmetal = "diatomic nonmetal"
    case polyatomicNonmetal = "polyatomic nonmetal"
    case alkaliMetal = "alkali metal"
    case alkalineEarthMetal = "alkaline earth metal"
    case transitionMetal = "transition metal"
    case postTransitionMetal = "post-transition metal"
    case nobleGas = "noble gas"
    case metalloid = "metalloid"
    case lanthanide = "lanthanide"
    case actinide = "actinide"
    case unknown = "unknown"
    case unknownProbablyTransitionMetal = "unknown, probably transition metal"
    case unknownProbablyPostTransitionMetal = "unknown, probably post-transition metal"
    case unknownProbablyMetalloid = "unknown, probably metalloid"
    case unknownPredictedNobleGas = "unknown, predicted to be noble gas"
    case unknownPredictedAlkaliMetal = "unknown, but predicted to be an alkali metal"
}

enum Phase: String, Codable {
    case solid = "Solid"
    case liquid = "Liquid"
    case gas = "Gas"
    case unknown = "Unknown"
}

let hydrogen = ElementModel(
    name: "Hydrogen",
    symbol: "H",
    atomicNumber: 1,
    atomicMass: 1.008,
    elementCategory: .diatomicNonmetal,
    phase: .gas,
    yearDiscovered: 1766,
    discoveredBy: "Antoine Lavoisier",
    colorHex: "#FFFFFF",
    bohrModelImage: "https://storage.googleapis.com/search-ar-edu/periodic-table/element_001_hydrogen/element_001_hydrogen_srp_th.png",
)

let helium = ElementModel(
    name: "Helium",
    symbol: "He",
    atomicNumber: 2,
    atomicMass: 4.0026,
    elementCategory: .nobleGas,
    phase: .gas,
    yearDiscovered: 1766,
    discoveredBy: "Antoine Lavoisier",
    colorHex: "#FFFFFF",
    bohrModelImage: "https://storage.googleapis.com/search-ar-edu/periodic-table/element_001_hydrogen/element_001_hydrogen_srp_th.png",
)

let lithium = ElementModel(
    name: "Lithium",
    symbol: "Li",
    atomicNumber: 3,
    atomicMass: 6.941,
    elementCategory: .alkaliMetal,
    phase: .solid,
    yearDiscovered: 1817,
    discoveredBy: "Martin von Trapp",
    colorHex: "#BFBFBF",
    bohrModelImage: "https://storage.googleapis.com/search-ar-edu/periodic-table/element_001_hydrogen/element_001_hydrogen_srp_th.png",
)

let beryllium = ElementModel(
    name: "Beryllium",
    symbol: "Be",
    atomicNumber: 4,
    atomicMass: 9.0122,
    elementCategory: .alkalineEarthMetal,
    phase: .solid,
    yearDiscovered: 1798,
    discoveredBy: "Daniel Rutherford",
    colorHex: "#AFAFAF",
    bohrModelImage: "https://storage.googleapis.com/search-ar-edu/periodic-table/element_001_hydrogen/element_001_hydrogen_srp_th.png",
)
