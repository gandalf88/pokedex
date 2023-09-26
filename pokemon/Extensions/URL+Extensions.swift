//
//  URL+Extensions.swift
//  pokemon
//
//  Created by Luis Villamizar on 12/9/23.
//

import Foundation

extension URL {
    
    static func getPokemons(_ limit: String) -> URL? {
        print("https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=0")
        return URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=0")
    }
    static func getPokemonsPaginate(_ limit: String, _ offset: String) -> URL? {
        print("https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)")
        return URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)")
    }
    static func getPokemonsByName(_ name: String) -> URL? {
        print()
        return URL(string:  "https://pokeapi.co/api/v2/pokemon/\(name)")
    }
    static var officialArtworkImge = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
}
