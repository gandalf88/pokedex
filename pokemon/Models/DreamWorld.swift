//
//  DreamWorld.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class DreamWorld: Codable {
    let frontDefault: String
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }

    init(frontDefault: String, frontFemale: String?) {
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
    }
}
