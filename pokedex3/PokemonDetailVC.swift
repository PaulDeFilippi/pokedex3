//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Paul Defilippi on 9/27/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    
    @IBOutlet weak var nameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name

        
    }

}
