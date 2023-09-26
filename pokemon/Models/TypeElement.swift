//
//  TypeElement.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class TypeElement: Codable {
    let slot: Int
    let type: Species

    init(slot: Int, type: Species) {
        self.slot = slot
        self.type = type
    }
}
