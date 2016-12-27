//
//  Pokemon.swift
//  PokedexApp
//
//  Created by Younoussa Ousmane Abdou on 12/27/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokemonID: Int!
    
    var name: String {
        
        return _name
    }
    
    var pokemonID: Int {
        
        return _pokemonID
    }
    
    init(name: String, pokemonID: Int) {
        
        _name = name
        _pokemonID = pokemonID
    }
}
