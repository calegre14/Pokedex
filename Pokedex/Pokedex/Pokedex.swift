//
//  Pokedex.swift
//  Pokedex
//
//  Created by Christopher Alegre on 10/1/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation

struct TopLevelDictionary {
    let name: String
    let id: Int
    let sprites: SpriteDictionary
    let abilities: [AbilityDictionary]
}

struct SpriteDictionary {
    let image: String
}

struct AbilityDictionary {
    let name: String
    
}

