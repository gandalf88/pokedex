//
//  RedBlue.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String
    let frontGray, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }

    init(backDefault: String, backGray: String, backTransparent: String, frontDefault: String, frontGray: String, frontTransparent: String) {
        self.backDefault = backDefault
        self.backGray = backGray
        self.backTransparent = backTransparent
        self.frontDefault = frontDefault
        self.frontGray = frontGray
        self.frontTransparent = frontTransparent
    }
}
