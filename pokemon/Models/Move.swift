//
//  Move.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }

    init(move: Species, versionGroupDetails: [VersionGroupDetail]) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }
}
