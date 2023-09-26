//
//  Result.swift
//  pokemon
//
//  Created by Luis Villamizar on 12/9/23.
//

import Foundation

class Pokemon: Codable, Identifiable {
    var id = UUID()
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        // Utiliza decodeIfPresent para permitir valores nulos
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
      
    }

    enum CodingKeys: String, CodingKey {
        case name, url
    }
}
