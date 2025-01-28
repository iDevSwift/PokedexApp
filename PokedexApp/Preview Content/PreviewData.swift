//
//  PreviewData.swift
//  PokedexApp
//
//  Created by Diego Maseda on 27/1/25.
//
/// Hemos generado este nuevo fichero para `#Preview` de datos, donde podemos colocar datos de pruebas para poder ver en las preview sin trabajar con todos los datos. Esto es necesario para cuando llamamos a una API con un montón de datos y estamos trabajando con el diseño de la app. De esta manera, solo cogemos una serie de datos de prueba para comprobar funcionamiento y diseños, esto es solo un ejempo. *17/10*
import Foundation
extension Pokemon { // Realizamos una extensión de Pokemons
    static let preview = Pokemon(name: "Squirtle", type: ["Water"], imageURL: URL(string:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"))
}
///Con esta linea lo que hacemos es generar un dato de prueba que podremos llamar como `preview`. El static let hace referencia a una propiedad estática. Al ser estática, pertenece a la clase o estructura Pokemon, no a una instancia específica de Pokemon. Esto significa que podemos acceder a ella directamente sin necesidad de crear un objeto.

