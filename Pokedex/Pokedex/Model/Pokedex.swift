//
//  Pokedex.swift
//  Pokedex
//
//  Created by Christopher Alegre on 10/1/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case abilities
        case name
        case id
        case spriteDictionary = "sprites"
    }
    
    let name: String
    let id: Int
    let spriteDictionary: SpriteDictionary
    let abilities: [AbilityDictionary]
    
}

struct SpriteDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
    let image: URL
}

struct AbilityDictionary: Decodable {
    let ability: Ability
    
    struct Ability: Decodable {
        let name: String
    }
}

