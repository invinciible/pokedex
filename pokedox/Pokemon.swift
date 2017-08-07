//
//  Pokemon.swift
//  pokedox
//
//  Created by Tushar Katyal on 06/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import Foundation

class Pokemon {
    
    var _name : String!
    var _PokedoxId : Int!
    var _description : String!
    var _weight : String!
    var _height : String!
    var _type : String!
    var _defense : String!
    var _attack : String!
    var _nextEvolutionText : String!
    
    var name : String {
        
        return _name
    }
    var pokedoxId : Int {
        return _PokedoxId
    }
    
    init(name : String , pokedoxId : Int) {
        
        self._name = name
        self._PokedoxId = pokedoxId
    }
    
}
