//
//  HeldItem.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class HeldItem: Codable {
    let item: Species
    let versionDetails: [VersionDetail]

    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }

    init(item: Species, versionDetails: [VersionDetail]) {
        self.item = item
        self.versionDetails = versionDetails
    }
}
