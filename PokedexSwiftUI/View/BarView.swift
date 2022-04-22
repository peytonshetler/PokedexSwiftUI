//
//  BarView.swift
//  PokedexSwiftUI
//
//  Created by Peyton Shetler on 4/21/22.
//

import SwiftUI

struct BarView: View {
    var value: Int = 100
    var title: String = "HP"
    var color: Color = .blue
    
    var body: some View {
        HStack {
            Text(title)
                //.padding(.leading, 32)
                .foregroundColor(.gray)
                .frame(width: 100)
            
            HStack {
                Text(value > 9999 ? "9999+" : "\(value)")
                    .frame(width: 50)
                    .padding(.trailing)
                                
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 180, height: 20)
                        .animation(.default, value: value)
                        .foregroundColor(Color(.systemGray5))
                    
                    Capsule()
                        .frame(
                            width: value > 250 ? CGFloat(180) : CGFloat(value),
                            height: 20
                        )
                        .animation(.default, value: value)
                        .foregroundColor(color)
                }
                Spacer()
            }.padding(.leading)
        }
    }
    
    func formatValueString(_ value: Int) -> String {
        return value > 999 ? "999+" : "\(value)"
    }
}

struct BarChartView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            BarView(value: pokemon.height, title: "Height", color: .orange)
            BarView(value: pokemon.attack, title: "Attack", color: .red)
            BarView(value: pokemon.defense, title: "Defense", color: .blue)
            BarView(value: pokemon.weight, title: "Weight", color: .purple)
            BarView(value: 100, title: "Total", color: .green)
        }.padding()
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
        BarChartView(pokemon: MOCK_POKEMON)
    }
}
