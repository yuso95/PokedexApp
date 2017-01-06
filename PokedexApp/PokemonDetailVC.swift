//
//  PokemonDetailVC.swift
//  PokedexApp
//
//  Created by Younoussa Ousmane Abdou on 12/29/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    // Var/Let/CP
    var pokemon: Pokemon!

    // Outlets
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var mainIMG: UIImageView!
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var typeLBL: UILabel!
    @IBOutlet weak var heightLBL: UILabel!
    @IBOutlet weak var weightLBL: UILabel!
    @IBOutlet weak var defenseLBL: UILabel!
    @IBOutlet weak var pokedexIDLBL: UILabel!
    @IBOutlet weak var attackLBL: UILabel!
    @IBOutlet weak var evolutionLBL: UILabel!
    @IBOutlet weak var currentEvolutionIMG: UIImageView!
    @IBOutlet weak var nextEvolutionIMG: UIImageView!
    
    // Actions
    
    @IBAction func backBTNPressed(sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLBL.text = pokemon.name.capitalized
        
        pokemon.downloadPokemonData {
            
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        descriptionLBL.text = pokemon.description
        heightLBL.text = pokemon.height
        weightLBL.text = pokemon.weight
        attackLBL.text = pokemon.attack
        defenseLBL.text = pokemon.defense
        typeLBL.text = pokemon.type
        pokedexIDLBL.text = "\(pokemon.pokemonID)"
        mainIMG.image = UIImage(named: "\(pokemon.pokemonID)")
        currentEvolutionIMG.image = UIImage(named: "\(pokemon.pokemonID)")
        nextEvolutionIMG.image = UIImage(named: "\(pokemon.nextEvolutionID)")
        
        if pokemon.nextEvolutionID == "" {
            
            evolutionLBL.text = "No Evolutions"
            nextEvolutionIMG.isHidden = true
        } else {
            
            nextEvolutionIMG.isHidden = false
            
            let str = "Next Evolution: \(pokemon.name) - LVL \(pokemon.nextEvolutionLevel)"
            evolutionLBL.text = str
        }
    }
}
