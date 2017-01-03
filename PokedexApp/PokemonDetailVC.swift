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
    var poke: Pokemon!

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
    @IBOutlet weak var currentEvolutionLBL: UIImageView!
    @IBOutlet weak var nextEvolutionLBL: UIImageView!
    
    // Actions
    
    @IBAction func backBTNPressed(sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLBL.text = poke.name
    }
}
