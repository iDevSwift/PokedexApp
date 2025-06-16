//
//  PokemonDetailView.swift
//  PokedexApp
//
//  Created by Diego Maseda Fernández on 15/6/25.
//
import SwiftUI
struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonImage(url: pokemon.imageURL)
                .imageScale(.large)
                .padding()
            Text(pokemon.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(pokemon.type.formatted(.list(type: .and)))
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(1)
        }
        .padding()
    }
}

#Preview {
    PokemonDetailView(pokemon:.preview)
}
