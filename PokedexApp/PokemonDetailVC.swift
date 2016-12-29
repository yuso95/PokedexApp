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
    // Actions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLBL.text = poke.name
    }
}
