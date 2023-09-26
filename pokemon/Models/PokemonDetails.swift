//
//  PokemonDetails.swift
//  pokemon
//
//  Created by Luis Villamizar on 13/9/23.
//

import Foundation

class PokemonDetails: Codable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [HeldItem]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let pastTypes: [JSONAny]
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }

    init(abilities: [Ability], baseExperience: Int, forms: [Species], gameIndices: [GameIndex], height: Int, heldItems: [HeldItem], id: Int, isDefault: Bool, locationAreaEncounters: String, moves: [Move], name: String, order: Int, pastTypes: [JSONAny], species: Species, sprites: Sprites, stats: [Stat], types: [TypeElement], weight: Int) {
        self.abilities = abilities
        self.baseExperience = baseExperience
        self.forms = forms
        self.gameIndices = gameIndices
        self.height = height
        self.heldItems = heldItems
        self.id = id
        self.isDefault = isDefault
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.name = name
        self.order = order
        self.pastTypes = pastTypes
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.weight = weight
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.abilities = try container.decode([Ability].self, forKey: .abilities)
        self.baseExperience = try container.decodeIfPresent(Int.self, forKey: .baseExperience) ?? 0
        self.forms = try container.decode([Species].self, forKey: .forms)
        self.gameIndices = try container.decode([GameIndex].self, forKey: .gameIndices)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height) ?? 0
        self.heldItems = try container.decode([HeldItem].self, forKey: .heldItems)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.isDefault = try container.decodeIfPresent(Bool.self, forKey: .isDefault) ?? false
        self.locationAreaEncounters = try container.decodeIfPresent(String.self, forKey: .locationAreaEncounters) ?? ""
        self.moves = try container.decode([Move].self, forKey: .moves)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.order = try container.decodeIfPresent(Int.self, forKey: .order) ?? 0
        self.pastTypes = try container.decode([JSONAny].self, forKey: .pastTypes)
        self.species = try container.decode(Species.self, forKey: .species)
        self.sprites = try container.decode(Sprites.self, forKey: .sprites)
        self.stats = try container.decode([Stat].self, forKey: .stats)
        self.types = try container.decode([TypeElement].self, forKey: .types)
        self.weight = try container.decodeIfPresent(Int.self, forKey: .weight) ?? 0
    }
}
