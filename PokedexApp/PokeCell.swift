//
//  PokeCell.swift
//  PokedexApp
//
//  Created by Younoussa Ousmane Abdou on 12/27/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbIMG: UIImageView!
    @IBOutlet weak var nameLBL: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        thumbIMG.image = UIImage(named: "\(self.pokemon.pokemonID)")
        nameLBL.text = self.pokemon.name
    }
}
