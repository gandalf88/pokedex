//
//  VersionGroupDetail.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }

    init(levelLearnedAt: Int, moveLearnMethod: Species, versionGroup: Species) {
        self.levelLearnedAt = levelLearnedAt
        self.moveLearnMethod = moveLearnMethod
        self.versionGroup = versionGroup
    }
}
