//
//  DiscoverPokemonViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

class DiscoverPokemonViewController: UIViewController {
    
   
    @IBOutlet weak var StackViewPokemon: UIStackView!
    @IBOutlet weak var imgPok: UIImageView!
    @IBOutlet weak var typePokLabel: UILabel!
    @IBOutlet weak var namePokLabel: UILabel!
    var pokemonArray = [Pokemon]()
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        StackViewPokemon.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sendr:)))
        swipeRight.direction = .right
        StackViewPokemon.addGestureRecognizer(swipeRight)
            
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sendr:)))
        swipeLeft.direction = .left
        StackViewPokemon.addGestureRecognizer(swipeLeft)
        
        fetchPokemon()
 
    }
    
    func fetchPokemon() {
        PokemonService.shared.fetchPokemon { (pokemonArray) in
          DispatchQueue.main.sync{
            self.pokemonArray = pokemonArray
            self.pokemon = pokemonArray[0]
            self.displayPokemon(pokemon: self.pokemon!)
          }
        }
    }
    
    func displayPokemon(pokemon: Pokemon) {
        self.imgPok.image = pokemon.image!
        self.namePokLabel.text = pokemon.name!
        self.typePokLabel.text = pokemon.type!
    }
    
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer?) {
        if let swipeGesture = sendr {
            switch swipeGesture.direction {
            case .right:
                displayPokemon(pokemon: pokemonArray[Int.random(in: 0...75)])
                
            case .left:
                displayPokemon(pokemon: pokemonArray[Int.random(in: 76...150)])
            default:
                break
            }
        }
    }

}
