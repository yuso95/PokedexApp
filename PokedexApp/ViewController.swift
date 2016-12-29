//
//  ViewController.swift
//  PokedexApp
//
//  Created by Younoussa Ousmane Abdou on 12/27/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    // Var/Let/CP
    var pokemons: [Pokemon] = []
    var filteredPokemons = [Pokemon]()
    var inSearchMode = false
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    // Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // CollectionView Setup
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // SearchBar Setuo
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parsePokemonCSV()
    }
    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        do {
            
            let cvs = try CSV(contentsOfURL: path!)
            let rows = cvs.rows
            
            for row in rows {
                
                let pokeID = Int(row["id"]!)!
                let pokeName = row["identifier"]!
                
                let pokemon = Pokemon(name: pokeName, pokemonID: pokeID)
                
                pokemons.append(pokemon)
            }
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
    }

    // UICollectionView functions
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            
            return filteredPokemons.count
        }
        
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke: Pokemon!
            
            if inSearchMode {
                
                poke = filteredPokemons[indexPath.row]
                cell.configureCell(pokemon: poke)
            } else {
                
                poke = pokemons[indexPath.row]
                cell.configureCell(pokemon: poke)
            }
            
            return cell
        } else {
            
            return UICollectionViewCell()
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 80)
    }
    
    // UISearchbar functions

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if searchBar.text == nil ||  searchBar.text == "" {
            
            inSearchMode = false
            collectionView.reloadData()
            view.endEditing(true)
        } else {
            
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredPokemons = pokemons.filter({ filteredName in filteredName.name.range(of: lower) != nil })
            collectionView.reloadData()
        }
    }
}

