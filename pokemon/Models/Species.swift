//
//  Species.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class Species: Codable {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Utiliza decodeIfPresent para permitir valores nulos o nil en name y url
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
