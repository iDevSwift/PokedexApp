//
//  Model.swift
//  PokedexApp
//
//  Created by Diego Maseda on 20/1/25.
//

import Foundation
/// Vamos a coger los datos del `struct` de _Pokemons_ que está más abajo.
struct PokemonLoad: Codable {
    let pokemon: [Pokemon]
}
/// Realizamos un `struct` con los datos provinientes del _.json_
struct Pokemon: Codable, Identifiable {
    /// El `UUID` tenemos que generarlo al ser `Identifiable` y hay que hacerlo como variable. Si hay un UUID que viene en el .json; cogerá ese. Si no es así, hará uno automaticamente por elemento.
    var id = UUID()
    let name: String
    let type: [String]
    /// Ponemos `URL?` poque puede que alguna dirección url esté mal, por que tenemos que hacerla que sea opcional.
    let imageURL: URL?
    /// Cunado no nos genera ID tenemos que generar este `CodingKeys` para modificar la estructura del _.json_ para que se puedan usar los valores que queremos recoger. Solo vamos a usar los datos del _.json_ que nos interesen.
    enum CodingKeys: CodingKey {
        case name
        case type
        case imageURL
    }
}
/// Con esta función lo que hacemos es generar la carga de los datos desde el _.json_.
func getPokemons() -> [Pokemon] {
    /// Generamos un `guard let` para controlar los datos del archivo _.json_. Si ese fichero llamado _"pokemons"_ de estilo _.json_ desapareciera, entonces devolveriamos un array vacio.
    guard let url = Bundle.main.url(forResource: "pokemons", withExtension: "json") else {
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
