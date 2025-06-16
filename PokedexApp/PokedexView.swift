//
//  ContentView.swift
//  PokedexApp
//
//  Created by Diego Maseda on 20/1/25.
//

import SwiftUI

struct PokedexView: View {
    let pokemons = getPokemons()
    @State private var showInspector = false
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(pokemons) { pokemon in
                        VStack {
                            PokemonCell(pokemon: pokemon)
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                Text("View Details")
                            }
                            .buttonStyle(.borderedProminent)
                            .clipShape(.capsule)
                        }
                        .padding()
                    }
                }
            }
            .padding()
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}



