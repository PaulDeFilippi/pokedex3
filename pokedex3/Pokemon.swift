//
//  Pokemon.swift
//  pokedex3
//
//  Created by Paul Defilippi on 9/24/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    // properties
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    // getters
    
    var description: String {
        
        if  _description == nil {
            
            _description = ""
        }
        return _description
        
    }
    
    var type: String {
        
        if _type == nil {
            
            _type = ""
        }
        return _type
        
    }
    
    var defense: String {
        
        if _defense == nil {
            
            _defense = ""
        }
        return _defense
        
    }
    
    var height: String {
        
        if _height == nil {
            
            _height = ""
        }
        return _height
        
    }
    
    var weight: String {
        
        if _weight == nil {
            
            _weight = ""
        }
        return _weight
        
    }
    
    var attack: String {
        
        if _attack == nil {
            
            _attack = ""
        }
        return _attack
        
    }
    
    var nextEvolutionText: String {
        
        if _nextEvolutionTxt == nil {
            
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
        
    }
    
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    // initializer
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL, method: .get).responseJSON { (response) in
            
            // print(response.result.value)
            // above print function allows us to test whether or not Alamofire is able to pull in the JSON from the poke API
            
            if let dict = response.result.value as? Dictionary<String, Any> {
                
                // above - we are letting dict equal the Dictionary that is being pulled in with the request sent through Alamofire
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                
                }
                
                if let attack = dict["attack"] as? Int {
                    
                    self._attack = "\(attack)"
                    
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = "\(defense)"
                    
                }
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                    
                    // above line of code shows how we dive into the data in the API to extract the "types" dictionary as a key of type String and an object of type String.  In this particular API we are mostly extracting info as arrays inside of dictionaries as you can see by the above []
                    
                    if let name = types[0]["name"] {
                        
                        self._type = name.capitalized
                    }
                    
                    // code below - the for loop - instantiated for Pokemon with more than 1 type
                    
                    if types.count > 1 {
                        
                        for x in 1..<types.count {
                            
                            if let name = types[x]["name"] {
                                
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                    
                    print(self._type)
                    // above line prints types to the console
                    
                } else {
                    
                    self._type = ""
                }
                
            }
            
            completed()
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}
