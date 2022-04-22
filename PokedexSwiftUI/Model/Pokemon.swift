//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Peyton Shetler on 4/19/22.
//

import Foundation
import SwiftUI

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int
    let type: String
    var evolutionChain: [EvolutionChain]?

    var backgroundColor: Color {
        switch self.type {
        case "fire": return .red
        case "poison": return .green
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .purple
        case "normal": return .gray
        case "ground": return .brown
        case "flying": return .orange
        case "fairy": return .indigo
        case "bug": return .green
        default:
            return .gray
    }
}
}

struct EvolutionChain: Decodable {
    let id: String?
    let name: String?
}

let MOCK_POKEMON = Pokemon(
    id: 1,
    name: "Bulbasaur",
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334",
    description: "Bulbasaur can be seen napping in bright sunlight.There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
    height: 7,
    weight: 69,
    attack: 49,
    defense: 49,
    type: "poison",
    evolutionChain: nil
)
