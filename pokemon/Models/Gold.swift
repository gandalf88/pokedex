//
//  Gold.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }

    init(backDefault: String, backShiny: String, frontDefault: String, frontShiny: String, frontTransparent: String?) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.frontTransparent = frontTransparent
    }
}
