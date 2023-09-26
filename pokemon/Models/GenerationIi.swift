//
//  GenerationIi.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class GenerationIi: Codable {
    let crystal: Crystal
    let gold, silver: Gold

    init(crystal: Crystal, gold: Gold, silver: Gold) {
        self.crystal = crystal
        self.gold = gold
        self.silver = silver
    }
}
