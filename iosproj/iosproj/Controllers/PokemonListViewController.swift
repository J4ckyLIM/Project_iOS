//
//  PokemonListViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

class PokemonListViewController: UIViewController {

    let pokemonService = PokemonService.shared
    
    var listOfPokemons:[Any] = []
    
    var nameOfPokemon: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getListOfPokemons()
    }
    
    func getListOfPokemons() {
        pokemonService.fetchPokemonList() { result in
            switch result {
            case .success(let pokemons):
                self.listOfPokemons = pokemons.results!
                print(pokemons.results![0])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPokemonByName(name: String) {
        pokemonService.fetchPokemon(name) { result in
            switch result {
            case .success(let pokemon):
                print(pokemon)
                self.listOfPokemons = [pokemon]
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
