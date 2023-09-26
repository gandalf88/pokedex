//
//  OfficialArtwork.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class OfficialArtwork: Codable {
    let frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    init(frontDefault: String, frontShiny: String) {
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}
