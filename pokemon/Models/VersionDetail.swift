//
//  VersionDetail.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class VersionDetail: Codable {
    let rarity: Int
    let version: Species

    init(rarity: Int, version: Species) {
        self.rarity = rarity
        self.version = version
    }
}
