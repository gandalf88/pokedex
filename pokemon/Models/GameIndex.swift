//
//  GameIndex.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation


class GameIndex: Codable {
    let gameIndex: Int
    let version: Species

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }

    init(gameIndex: Int, version: Species) {
        self.gameIndex = gameIndex
        self.version = version
    }
}
