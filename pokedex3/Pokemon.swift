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
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    
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
