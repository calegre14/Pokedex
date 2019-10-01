//
//  PokemonController.swift
//  Pokedex
//
//  Created by Christopher Alegre on 10/1/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit


class PokemonController {
    
    static func fetchPokemon(with searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        // Set a base URL
        // This should be outside the function on the test
        guard let baseURL = URL(string: "https://pokeapi.co/api/v2/") else {return}
        // Add first Component
        let pokemonComponent = baseURL.appendingPathComponent("pokemon")
        // Add additional Component
        let finalURL = pokemonComponent.appendingPathComponent(searchTerm)
        print(finalURL)
        
        // Perform the dataTask
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            if let data = data {
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(pokemon)
                } catch {
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    completion(nil); return
                }
            }
        } .resume()
    }
    
    static func fetchImage(pokemon: Pokemon, completion: @escaping (UIImage?) -> Void) {
        let finalURL = pokemon.spriteDictionary.image
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            completion(image)
        }
        dataTask.resume()
    }
}

