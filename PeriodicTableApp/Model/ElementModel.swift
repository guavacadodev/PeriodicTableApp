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
    /*
     add more properties later such as
     - boiling point
     - electonegativity ...
     */
    
}

enum ElementCategory: String, Codable {
    case metalloid = "Metalloid"
    case nonmetal = "Non-Metal"
    case alkaliMetal = "Alkali Metal"
    case alkalineEarthMetal = "Alkaline Earth Metal"
    case transitionMetal = "Transition Metal"
    case postTransitionMetal = "Post-Transition Metal"
    case halogen = "Halogen"
    case nobleGas = "Noble Gas"
    case lanthanide = "Lanthanide"
    case actinide = "Actinide"
    case unknown = "Unknown"
}

enum Phase: String, Codable {
    case solid = "Solid"
    case liquid = "Liquid"
    case gas = "Gas"
    case plasma = "Plasma"
    case unknown = "Unknown"
}

let hydrogen = ElementModel(
    name: "Hydrogen",
    symbol: "H",
    atomicNumber: 1,
    atomicMass: 1.008,
    elementCategory: .nonmetal,
    phase: .gas,
    yearDiscovered: 1766,
    discoveredBy: "Antoine Lavoisier",
    colorHex: "#FFFFFF",
)

let helium = ElementModel(
    name: "Helium",
    symbol: "He",
    atomicNumber: 2,
    atomicMass: 4.0026,
    elementCategory: .nonmetal,
    phase: .gas,
    yearDiscovered: 1766,
    discoveredBy: "Antoine Lavoisier",
    colorHex: "#FFFFFF",
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
)

let beryllium = ElementModel(
    name: "Beryllium",
    symbol: "Be",
    atomicNumber: 4,
    atomicMass: 9.0122,
    elementCategory: .alkaliMetal,
    phase: .solid,
    yearDiscovered: 1798,
    discoveredBy: "Daniel Rutherford",
    colorHex: "#AFAFAF",
)
