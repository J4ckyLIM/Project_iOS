//
//  DiscoverPokemonViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

class DiscoverPokemonViewController: UIViewController {
    
    let pokemonService = PokemonService.shared
    
    // Créer une variable gesture
    // Autoriser la gesture sur la vue (view)
    // Definir la gesture (swip/tap/pinch)
    // Creer une fonction d'action (@objec func) pour charger une nouveau pokemon dependant de la gesture (random integer entre 1 et 155)
    // Créer une variable pokemons de type array de pokemon
    // récuperer les datas d'un pokémon grace au pokemon service
    // afficher les datas du pokemon sur l'ecran

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
