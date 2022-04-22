//
//  PokemonViewModel.swift
//  PokedexSwiftUI
//
//  Created by Peyton Shetler on 4/19/22.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var filteredPokemon = [Pokemon]()
    private let BASE_URL = "http://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon()
    }
    
    func filterPokemon(by type: String) {
        self.filteredPokemon = pokemon.filter { $0.type == type }
    }
    

    func fetchPokemon() {
        guard let url = URL(string: BASE_URL) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data?.parseData(removeString: "null,") else {
                print("ERROR: data issue")
                return
            }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {
                print("ERROR: decoding issue")
                return
            }

            DispatchQueue.main.async { self.pokemon = pokemon }
        }.resume()
    }
}


extension Data {
    // In the API we're consuming, there's an extra string that needs to be removed
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
