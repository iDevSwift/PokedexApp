//
//  ContentView.swift
//  PokedexApp
//
//  Created by Diego Maseda on 20/1/25.
//

import SwiftUI

struct PokedexView: View {
    let pokemons = getPokemons()
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                HStack {
                    AsyncImage(url: pokemon.imageURL) { image in
                        image
                            .scaledToFit()
                            .imageScale(.small)
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading){
                        Text(pokemon.name)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.blue)
                        Text(pokemon.type.formatted(.list(type: .and)))
                            .font(.callout)
                            .foregroundStyle(.black)
                    }
                }
            }
            .navigationTitle("Pokémon List")
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbarBackground(Color.blue.opacity(0.4), for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    PokedexView()
}
