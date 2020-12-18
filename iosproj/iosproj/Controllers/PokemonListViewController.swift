//
//  PokemonListViewController.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import UIKit

import SwiftUI

private let cellIdentifier = "CollectionCell"

class PokemonListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    var pokemons = [Pokemon]()
    
    var filteredPokemons = [Pokemon]()
    
    let sectionInsets = UIEdgeInsets(top: 30.0,
                                     left: 15.0,
                                     bottom: 15.0,
                                     right: 15.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchButton.layer.borderWidth = 1
        self.searchButton.layer.cornerRadius = 5
        self.searchButton.layer.masksToBounds = true
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.pokemonCollection.dataSource = self
        self.pokemonCollection.delegate = self

        
        self.pokemonCollection.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCell")
        
        fetchPokemons()
    
    }
    
    func fetchPokemons() {
        PokemonService.shared.fetchPokemon { (pokemons) in
            DispatchQueue.main.async {
                self.pokemons = pokemons
                self.filteredPokemons = pokemons
                self.pokemonCollection.reloadData()
            }
        }
    }
    
    
    @IBAction func searchPokemon(_ sender: Any) {
        var searchText = self.searchField.text
        
        if searchText == ""{
            self.filteredPokemons = self.pokemons
        }
        else {
            let tempListPokemons = self.pokemons
            self.filteredPokemons =  tempListPokemons.filter({ $0.name?.range(of: (searchText?.lowercased())!) != nil })
            
            pokemonCollection.reloadData()
        }
    }
    
    @IBAction func searchPokemonByInput(_ sender: UITextField) {
        
        var search = sender.text!
        
        if search == "" {
            fetchPokemons()
        }
        else {
            let tempListPokemons = self.pokemons
            self.filteredPokemons =  tempListPokemons.filter({ $0.name?.range(of: (search.lowercased())) != nil })
            
            pokemonCollection.reloadData()
        }
    }
    
    
    @IBSegueAction func showContact(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContactView())
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filteredPokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokemonCollection.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCollectionViewCell
        cell.configureCell(pokemon: filteredPokemons[indexPath.row])

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PokemonDetail") as? PokemonDetailViewController {
            vc.pokemon = filteredPokemons[indexPath.row]
            
            self.present(vc, animated: true)
        }
    }
    
    // MARK: - Collection View Flow Layout Delegate
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * 0.3
        let availableWidth =  view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 4

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
    

}
