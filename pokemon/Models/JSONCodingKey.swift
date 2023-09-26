//
//  JSONCodingKey.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}
