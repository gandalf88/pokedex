//
//  Ability.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }

    init(ability: Species, isHidden: Bool, slot: Int) {
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}
