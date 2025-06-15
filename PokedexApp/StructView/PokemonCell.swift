//
//  PokemonCell.swift
//  PokedexApp
//
//  Created by Diego Maseda on 27/1/25.
//
import SwiftUI
struct PokemonCell: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonImage(url: pokemon.imageURL)
                .scaledToFit()
                .frame(height: 100)
            Text(pokemon.name)
                .font(.headline)
            Text(pokemon.type.formatted(.list(type: .and)))
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(1)
        }
        .padding()
    }
}

#Preview { // Es recomendable poner las Previews en la gran mayoria de modularizaciones de SwiftUI para tener una idea de como va a quedar.
    // Julio recomienda ENCARECIDAMENTE trabajar con preview. Clase del dia 17/10
    PokemonCell(pokemon:.preview)
}
