//
//  GenerationV.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class GenerationV: Codable {
    let blackWhite: Sprites

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }

    init(blackWhite: Sprites) {
        self.blackWhite = blackWhite
    }
}
