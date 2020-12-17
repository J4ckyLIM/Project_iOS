//
//  DiscoverPokemonViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

class DiscoverPokemonViewController: UIViewController {
    
   
    @IBOutlet weak var StackViewPokemon: UIStackView!
    @IBAction func SwipeAction(_ sender: Any) {
        print("jai swipe")
    }
    @IBOutlet weak var imgPok: UIImageView!
    @IBOutlet weak var typePokLabel: UILabel!
    @IBOutlet weak var namePokLabel: UILabel!
    // let pokemonService = PokemonService.shared
    var pokemonArray = [Pokemon]()
    var pokemon: Pokemon?
   
    
    
    // Créer une variable gesture
    // Autoriser la gesture sur la vue (view)
    // Definir la gesture (swip/tap/pinch)
    // Creer une fonction d'action (@objec func) pour charger une nouveau pokemon dependant de la gesture (random integer entre 1 et 155)
    // Créer une variable pokemons de type array de pokemon
    // récuperer les datas d'un pokémon grace au pokemon service
    // afficher les datas du pokemon sur l'ecran

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        StackViewPokemon.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sendr:)))
        swipeRight.direction = .right
        StackViewPokemon.addGestureRecognizer(swipeRight)
            
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sendr:)))
        swipeLeft.direction = .left
        StackViewPokemon.addGestureRecognizer(swipeLeft)
      //  let randomNumber=Int.random(in: 0...150)
        // Do any additional setup after loading the view.
      PokemonService.shared.fetchPokemon { (pokemonArray) in
        print("okok")
        DispatchQueue.main.sync{
            self.namePokLabel.text = pokemonArray[0].name
            self.typePokLabel.text = pokemonArray[0].type
            self.imgPok.image = pokemonArray[0].image
            print(pokemonArray[0].name)
                        }
     
        }
        
 
    }
    
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer?) {
      //  let randomNumber=Int.random(in: 0...150)
        if let swipeGesture = sendr {
            switch swipeGesture.direction {
            case .right:
                print("droite")
                PokemonService.shared.fetchPokemon { (pokemonArray) in
                DispatchQueue.main.sync{
                    self.namePokLabel.text = pokemonArray[0].name
                    self.typePokLabel.text = pokemonArray[0].type
                    self.imgPok.image = pokemonArray[0].image
                }
                
            }
            case .left:
                print("gauche")
                PokemonService.shared.fetchPokemon { (pokemonArray) in
                DispatchQueue.main.sync{
                    self.namePokLabel.text = pokemonArray[0].name
                    self.typePokLabel.text = pokemonArray[0].type
                    self.imgPok.image = pokemonArray[0].image
                }
                
            }
            default:
                break
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
