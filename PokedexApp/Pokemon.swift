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
    private var _description: String!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _defense: String!
    private var _pokedexID: String!
    private var _attack: String!
    
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
