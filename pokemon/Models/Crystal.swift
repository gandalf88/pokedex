//
//  Crystal.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }

    init(backDefault: String, backShiny: String, backShinyTransparent: String, backTransparent: String, frontDefault: String, frontShiny: String, frontShinyTransparent: String, frontTransparent: String) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.backShinyTransparent = backShinyTransparent
        self.backTransparent = backTransparent
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.frontShinyTransparent = frontShinyTransparent
        self.frontTransparent = frontTransparent
    }
}
