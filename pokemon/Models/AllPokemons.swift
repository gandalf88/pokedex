//
//  Resume.swift
//  pokemon
//
//  Created by Luis Villamizar on 12/9/23.
//

import Foundation

class AllPokemons: Codable {
    let count: Int
    var next: String
    var previous: String
    let results: [Pokemon]

    init(count: Int, next: String, previous: String, results: [Pokemon]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)

        // Utiliza decodeIfPresent para permitir valores nulos
        self.next = try container.decodeIfPresent(String.self, forKey: .next) ?? ""
        self.previous = try container.decodeIfPresent(String.self, forKey: .previous) ?? ""

        self.results = try container.decode([Pokemon].self, forKey: .results)
    }

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
}
