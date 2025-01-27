//
//  PokemonCell.swift
//  PokedexApp
//
//  Created by Diego Maseda on 27/1/25.
//
import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon // Tenemos que hacer esta inyección de dependencia de Pokemon para que funcione la modularización del HStack.
    var body: some View {
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
}

#Preview { // Es recomendable poner las Previews en la gran mayoria de modularizaciones de SwiftUI para tener una idea de como va a quedar.
    // Julio recomienda ENCARECIDAMENTE trabajar con preview. Clase del dia 17/10
    PokemonCell(pokemon:.preview)
}
