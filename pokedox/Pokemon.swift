//
//  Pokemon.swift
//  pokedox
//
//  Created by Tushar Katyal on 06/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import Foundation
import Alamofire
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
    private var _pokemonUrl : String!
    
    var description : String {
        if _description == nil {
            
            _description = ""
        }
        return _description
    }
    
    var weight : String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    var height : String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    var type : String {
        
        if _type == nil {
            _type = ""
        }
        return _type
    }
    var defense : String {
        if _defense == nil {
             _defense = ""
        }
        return _defense
    }
    var attack : String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    var nextEvol : String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    
    var name : String {
        
        return _name
    }
    var pokedoxId : Int {
        return _PokedoxId
    }
    
    init(name : String , pokedoxId : Int) {
        
        self._name = name
        self._PokedoxId = pokedoxId
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedoxId)/"
        
    }
    
    func downloadPokemonDetail(completed : @escaping DownloadComplete){
        
        Alamofire.request(_pokemonUrl).responseJSON { (response) in
            
         if let dict = response.result.value as? Dictionary<String, AnyObject> {
            
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

            
        }
         completed()   
        }
        
    }
    
}
