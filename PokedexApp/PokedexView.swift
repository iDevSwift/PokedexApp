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
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                PokemonCell(pokemon: pokemon) // Hacemos una inyeccion de dependencia de la componentización del HStack. *17/10
            }
            .navigationTitle("Pokedex List")
//            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
//            .toolbarBackground(Color.blue.opacity(0.4), for: .navigationBar)
            .toolbar {
                ButtonInformationView().padding(40)
            }
        }
    }
}

#Preview {
    PokedexView()
}


