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
    @State private var showDetails = false
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(pokemons) { pokemon in
                        VStack {
                            PokemonCell(pokemon: pokemon)
                            Button {
                                showDetails.toggle()
                            } label: {
                                Text("View Details")
                            }
                            .popover(isPresented: $showDetails) {
                                PokemonDetailView(pokemon: .preview)
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


