//
//  GenerationIv.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }

    init(diamondPearl: Sprites, heartgoldSoulsilver: Sprites, platinum: Sprites) {
        self.diamondPearl = diamondPearl
        self.heartgoldSoulsilver = heartgoldSoulsilver
        self.platinum = platinum
    }
}
