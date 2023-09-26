//
//  GenerationVii.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class GenerationVii: Codable {
    let icons: DreamWorld
    let ultraSunUltraMoon: Home

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }

    init(icons: DreamWorld, ultraSunUltraMoon: Home) {
        self.icons = icons
        self.ultraSunUltraMoon = ultraSunUltraMoon
    }
}
