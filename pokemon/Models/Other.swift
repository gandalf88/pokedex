//
//  Other.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class Other: Codable {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
    }

    init(dreamWorld: DreamWorld, home: Home, officialArtwork: OfficialArtwork) {
        self.dreamWorld = dreamWorld
        self.home = home
        self.officialArtwork = officialArtwork
    }
}
