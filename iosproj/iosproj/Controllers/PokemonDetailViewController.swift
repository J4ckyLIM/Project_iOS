//
//  PokemonDetailViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit
import QuartzCore

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Pokemon?
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonId: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonName.text = self.pokemon?.name?.firstLetterToUpperCase()
        pokemonId.text = self.pokemon?.type
        pokemonImage.image = self.pokemon?.image
        pokemonDescription.text = self.pokemon?.description
        pokemonAttack.text = String((self.pokemon?.attack)!)
        pokemonDefense.text = String((self.pokemon?.defense)!)
        
        pokemonDescription.layer.cornerRadius = 10
        pokemonDescription.layer.masksToBounds = true
        pokemonDescription.layer.borderWidth = 2
        
        view.layer.borderWidth = 15
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.masksToBounds = true
        
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
