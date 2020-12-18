//
//  PokemonCollectionViewCell.swift
//  iosproj
//
//  Created by Jacky LIM on 18/12/2020.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemonImageView.image = pokemon.image!
        self.pokemonName.text = pokemon.name!.firstLetterToUpperCase()
        
    }
    
    

}
