//
//  PokemonDetailViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Pokemon?
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonId: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonName.text = self.pokemon?.name
        pokemonId.text = String((self.pokemon?.id)!)
        pokemonImage.image = self.pokemon?.image    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
