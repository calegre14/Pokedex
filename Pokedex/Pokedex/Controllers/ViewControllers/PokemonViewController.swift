//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Christopher Alegre on 10/1/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spriteImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
    }
    
    
    func updateView(pokemon: Pokemon, image: UIImage) {
        DispatchQueue.main.async {
            self.pokemonNameLabel.text = pokemon.name
            self.pokemonIDLabel.text = "\(pokemon.id)"
            self.pokemonAbilitiesLabel.text = pokemon.abilities[0].ability.name
            self.spriteImage.image = image
        }
    }
} //End of class


extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        PokemonController.fetchPokemon(with: searchText) { (pokemon) in
            guard let pokemon = pokemon else {return}
            PokemonController.fetchImage(pokemon: pokemon) { (image) in
                guard let image = image else {return}
                self.updateView(pokemon: pokemon, image: image)
            }
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
}
