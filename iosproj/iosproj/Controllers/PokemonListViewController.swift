//
//  PokemonListViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

private let cellIdentifier = "CollectionCell"

class PokemonListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    var pokemons = [Pokemon]()
    
    let sectionInsets = UIEdgeInsets(top: 30.0,
                                     left: 15.0,
                                     bottom: 15.0,
                                     right: 15.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.pokemonCollection.dataSource = self
        self.pokemonCollection.delegate = self

        self.pokemonCollection.register(PokemonCell.self, forCellWithReuseIdentifier: "PokemonCell")
        
        fetchPokemons()
    

    }
    
    func fetchPokemons() {
        PokemonService.shared.fetchPokemon { (pokemons) in
            DispatchQueue.main.async {
                self.pokemons = pokemons
                self.pokemonCollection.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.pokemons.count)
        return self.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokemonCollection.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        print(pokemons[indexPath.row].name!)
        cell.backgroundColor = UIColor.black
        cell.pokemonName?.text = "pokfodjfdj"
//        cell.pokemonName?.text = pokemons[indexPath.row].name!
//        cell.pokemonImage?.image = pokemons[indexPath.row].image!
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
//            vc.selectedImage = Image(name: pictures[indexPath.row])
//
//            navigationController?.pushViewController(vc, animated: true)
//        }
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PokemonDetail") as? PokemonDetailViewController {
            vc.pokemon = pokemons[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    
    
    // MARK: - Collection View Flow Layout Delegate
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (3 + 1)
        let availableWidth =  view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 3

        return CGSize(width: widthPerItem, height: widthPerItem)
      }
    
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left / 2
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    

}
