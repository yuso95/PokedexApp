//
//  Pokemon.swift
//  PokedexApp
//
//  Created by Younoussa Ousmane Abdou on 12/27/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokemonID: Int!
    private var _description: String!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _defense: String!
    private var _pokedexID: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionLevel: String!
    private var _nextEvolutionID: String!
    private var _pokemonURL: String!
    
    var name: String {
        
        return _name
    }
    
    var pokemonID: Int {
        
        return _pokemonID
    }
    
    var description: String {
        
        if _description == nil {
            
            return ""
        }
        
        return _description
    }
    
    var type: String {
        
        if _type == nil {
            
            return ""
        }
        
        return _type
    }
    
    var height: String {
        
        if _height == nil {
            
            return ""
        }
        
        return _height
    }
    
    var weight: String {
        
        if _weight == nil {
            
            return ""
        }
        
        return _weight
    }
    
    var attack: String {
        
        if _attack == nil {
            
            return ""
        }
        
        return _attack
    }
    
    var defense: String {
        
        if _defense == nil {
            
            return ""
        }
        
        return _defense
    }
    
    var pokedexID: String {
        
        if _pokedexID == nil {
            
            return ""
        }
        
        return _pokedexID
    }
    
    var nextEvolutionTxt: String {
        
        if _nextEvolutionTxt == nil {
            
            return ""
        }
        
        return _nextEvolutionTxt
    }
    
    var nextEvoltionName: String {
        
        if _nextEvolutionName == nil {
            
            return ""
        }
        
        return _nextEvolutionName
    }
    
    var nextEvolutionLevel: String {
        
        if _nextEvolutionLevel == nil {
            
            _nextEvolutionLevel = ""
        }
        
        return _nextEvolutionLevel
    }
    
    var nextEvolutionID: String {
        
        if _nextEvolutionID == nil {
            
            _nextEvolutionID = ""
        }
        
        return _nextEvolutionID
    }
    
    var pokemonURL: String {
        
        return _pokemonURL
    }
    
    init(name: String, pokemonID: Int) {
        
        _name = name
        _pokemonID = pokemonID
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokemonID)/"
    }
    
    func downloadPokemonData(completed: @escaping DownloadComplete) {
        
        Alamofire.request(pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                }
                
                if let attack = dict["attack"] as? Int {
                    
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>], types.count > 0 {
                    
                    if let name = types[0]["name"] as? String {
                        
                        self._type = name.capitalized
                        
                        if types.count > 1 {
                            
                            for x in 1..<types.count {
                                
                                if let name = types[x]["name"] as? String {
                                    
                                    self._type! += "/\(name.capitalized)"
                                }
                            }
                        }
                    } else {
                        
                        self._type = ""
                    }
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String, String>], descriptions.count > 0 {
                    
                    if let resource_uri = descriptions[0]["resource_uri"] {
                        
                        let descriptionURL = "\(URL_BASE)\(resource_uri)"
                        
                        Alamofire.request(descriptionURL).responseJSON(completionHandler: { (response) in
                            
                            if let descriptionDict = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descriptionDict["description"] as? String {
                                    
                                    self._description = description
                                    
                                    print("description: \(self.description)")
                                }
                            }
                            
                            completed()
                        })
                    }
                } else {
                    
                    self._description = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
                    
                    if let nextEvolution = evolutions[0]["to"] as? String {
                        
                        if nextEvolution.range(of: "mega") == nil {
                            
                            self._nextEvolutionName = nextEvolution
                            
                            print("to: \(self.nextEvoltionName)")
                        }
                        
                        if let level = evolutions[0]["level"] as? Int {
                            
                            self._nextEvolutionLevel = "\(level)"
                            
                            print("level: \(self.nextEvolutionLevel)")
                        } else {
                            
                            self._nextEvolutionLevel = ""
                        }
                        
                        if let resource_uri = evolutions[0]["resource_uri"] as? String {
                            
                            let newResource = resource_uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                            let id = newResource.replacingOccurrences(of: "/", with: "")
                            
                            self._nextEvolutionID = id
                            
                            print("id: \(self.nextEvolutionID)")
                        }
                    }
                }
                
                print("height: \(self.height)")
                print("weight: \(self.weight)")
                print("attack: \(self.attack)")
                print("defense: \(self.defense)")
                print("type: \(self.type)")
            }
        }
        
        completed()
    }
}
