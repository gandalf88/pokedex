//
//  GenerationI.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class GenerationI: Codable {
    let redBlue, yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }

    init(redBlue: RedBlue, yellow: RedBlue) {
        self.redBlue = redBlue
        self.yellow = yellow
    }
}
