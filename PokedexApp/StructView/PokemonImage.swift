//
//  PokemonImage.swift
//  PokedexApp
//
//  Created by Diego Maseda Fernández on 28/1/25.
//

/// Aqui lo que hacemos es generarnos un `struct` donde vamos a modularizar la imagen de los pokemons para componentizarla (igual que los PokemonCell)
import SwiftUI
struct PokemonImage: View {
    let url: URL?
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .scaledToFit()
                .imageScale(.small)
                .frame(width: 50, height: 50)
        } placeholder: {
            ProgressView()
        }
        .shadow(color: .black.opacity(0.4), radius: 12)
    }
}

#Preview {
    PokemonImage(url: Pokemon.preview.imageURL)
}
