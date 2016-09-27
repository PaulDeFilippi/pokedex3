//
//  Pokemon.swift
//  pokedex3
//
//  Created by Paul Defilippi on 9/24/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import Foundation

class Pokemon {
    
    // properties
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    
    // getters
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
    }
}
