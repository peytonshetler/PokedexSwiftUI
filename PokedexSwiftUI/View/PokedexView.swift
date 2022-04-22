//
//  PokedexView.swift
//  PokedexSwiftUI
//
//  Created by Peyton Shetler on 4/19/22.
//

import SwiftUI

struct PokedexView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    @State var shouldShowFilterButtons = false
    @State var filterApplied = false
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var dataSource: [Pokemon] {
        return filterApplied ? viewModel.filteredPokemon : viewModel.pokemon
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(dataSource) { pokemon in
                            NavigationLink(
                                destination: NavigationLazyView(PokemonDetailView(pokemon: pokemon)),
                                label: {
                                    PokemonCell(pokemon: pokemon)
                                        .frame(width: 220, height: 108)
                                        .padding(.horizontal)
                                })
                        }
                    }
                }
                .navigationBarTitle("Pokemon")
                .onAppear {
                    viewModel.fetchPokemon()
                }
                
                VStack {
                    if shouldShowFilterButtons {
                        ActionButton(imageName: "fire", backgroundColor: .red, show: $shouldShowFilterButtons) {
                            filterApplied.toggle()
                            shouldShowFilterButtons.toggle()
                            viewModel.filterPokemon(by: "fire")
                        }
                        ActionButton(imageName: "leaf", backgroundColor: .green, show: $shouldShowFilterButtons) {
                            filterApplied.toggle()
                            shouldShowFilterButtons.toggle()
                            viewModel.filterPokemon(by: "poison")

                        }
                        ActionButton(imageName: "water", backgroundColor: .blue, show: $shouldShowFilterButtons) {
                            filterApplied.toggle()
                            shouldShowFilterButtons.toggle()
                            viewModel.filterPokemon(by: "water")

                        }
                        ActionButton(imageName: "lightning", backgroundColor: .yellow, show: $shouldShowFilterButtons) {
                            filterApplied.toggle()
                            shouldShowFilterButtons.toggle()
                            viewModel.filterPokemon(by: "electric")
                        }
                    }
                    
                    let imageName = filterApplied ? "refresh" : "filter"
                    ActionButton(imageName: imageName, height: 36, width: 36, show: $shouldShowFilterButtons) {
                        filterApplied ? filterApplied.toggle() : shouldShowFilterButtons.toggle()
                    }
                    .rotationEffect(.degrees(self.shouldShowFilterButtons ? 180 : 0))
                    
                }
                .padding()
                .animation(.spring(), value: self.shouldShowFilterButtons)
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
