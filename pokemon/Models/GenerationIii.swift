//
//  GenerationIii.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class GenerationIii: Codable {
    let emerald: OfficialArtwork
    let fireredLeafgreen, rubySapphire: Gold

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }

    init(emerald: OfficialArtwork, fireredLeafgreen: Gold, rubySapphire: Gold) {
        self.emerald = emerald
        self.fireredLeafgreen = fireredLeafgreen
        self.rubySapphire = rubySapphire
    }
}
