//
//  PokemonListViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

class PokemonListViewController: UIViewController {

    let pokemonService = PokemonService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    

}
