//
//  DiscoverPokemonViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

class DiscoverPokemonViewController: UIViewController {
    
    let pokemonService = PokemonService.shared
    
    var currentDisplayedPokemon: Any = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getRandomPokemon(id: Int) {
        pokemonService.fetchPokemon(id) { result in
            switch result {
            case .success(let pokemon):
                print(pokemon)
                self.currentDisplayedPokemon = pokemon
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
