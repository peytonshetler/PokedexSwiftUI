//
//  PokemonCell.swift
//  PokedexSwiftUI
//
//  Created by Peyton Shetler on 4/18/22.
//

import SwiftUI
import Kingfisher

// KINGFISHER: A package for downloading / caching images
// github: https://github.com/onevcat/Kingfisher
struct PokemonCell: View {
    
    // This acts almost like our init. It indicates that the Pokemon cell has to be initialized with a pokemon
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(pokemon.backgroundColor)
        .cornerRadius(12)
        .shadow(color: pokemon.backgroundColor, radius: 6, x: 0, y: 0)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON)
    }
}
