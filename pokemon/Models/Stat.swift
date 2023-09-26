//
//  Stat.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class Stat: Codable {
    let baseStat, effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }

    init(baseStat: Int, effort: Int, stat: Species) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}
