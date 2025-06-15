//
//  PokemonImage.swift
//  PokedexApp
//
//  Created by Diego Maseda Fernández on 28/1/25.
//
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
