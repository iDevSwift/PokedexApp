//
//  Model.swift
//  PokedexApp
//
//  Created by Diego Maseda on 20/1/25.
//

import Foundation
struct PokemonLoad: Codable {
    let pokemon: [Pokemon]
}
struct Pokemon: Codable, Identifiable {
    var id = UUID() // Generamos un ID único para cada Pokemon. Si no viene el ID del .json, entonces generamos uno nuevo.
    let name: String // El nombre es un String, ya que es un texto.
    let type: [String] // El tipo es un array de String, ya que un Pokemon puede tener varios tipos.
    let imageURL: URL? // Si no viene la imagen, entonces será un valor opcional.
    enum CodingKeys: CodingKey { // Creamos una enumeración para los keys de codificación. Cuando no nos genera ID tenemos que generar este `CodingKeys` para modificar la estructura del .json para que se puedan usar los valores que queremos recoger. Solo vamos a usar los datos del .json que nos interesen.
        case name
        case type
        case imageURL
    }
}
func getPokemons() -> [Pokemon] { // Esta función devuelve un array de `Pokemon` cargados desde un archivo _.json_.
    guard let url = Bundle.main.url(forResource: "pokemons", withExtension: "json") else { // Intentamos cargar el archivo _.json_ desde el bundle principal de la aplicación. Generamos un `guard let` para controlar los datos del archivo _.json_. Si ese fichero llamado _"pokemons"_ de estilo _.json_ desapareciera, entonces devolveriamos un array vacio.
        return []
    }
    /// Con este bloque `do` lo que estamos haciendo es controlar los errores que puedan venir de la carga de datos desde le archivo _.json_. Con el `let data = try` lo que intentamos hacer es entrar en los datos del archivo JSON. Si todo va bien y no da errores, entonces almacena los datos en la funcion de `PokemonLoad` siguiendo la estructura de `pokemon`.
    /// Si no consiguera conseguir los datos o hubiera algún problema, entonces saltaría un error y devolveria un array vacio.
    do {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(PokemonLoad.self, from: data).pokemon
    } catch {
        print(error)
        return []
    }
}
