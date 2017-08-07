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
    
   private var _name : String!
   private var _PokedoxId : Int!
   private var _description : String!
   private var _weight : String!
   private var _height : String!
   private var _type : String!
   private var _defense : String!
   private var _attack : String!
   private var _pokemonUrl : String!
   private var _nextEvolutionName : String!
   private var _nextEvolutionId : String!
   private var _nextEvolutionLvl : String!
    
    var nextEvolName : String {
        
        if _nextEvolutionName == nil {
            _nextEvolutionName = ""
        }
        return _nextEvolutionName
    }
    
    var nextEvolId : String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvolLvl : String {
        if _nextEvolutionLvl == nil {
            _nextEvolutionLvl = ""
        }
        return _nextEvolutionLvl
    }
    
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
    
    //  parsing API data using Alamofire here
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
            if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0{
                
                if let name = types[0]["name"] {
                    self._type = name.capitalized
                    
                    if types.count > 1 {
                        
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                        }
                      }
                    }
                    
                }
                
                
            }
            
            if let descArr = dict["descriptions"] as? [Dictionary<String,String>], descArr.count>0 {
                
                if let url = descArr[0]["resource_uri"] {
                    let decURL = "\(URL_BASE)\(url)"
                    Alamofire.request(decURL).responseJSON(completionHandler: { (response) in
                        
                        if let descDict = response.result.value as? Dictionary<String,AnyObject> {
                            if let description = descDict["description"] as? String {
                            let newDesc = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                self._description = newDesc
                                print(self._description)
                            }
                        }
                        completed()
                    })
                }
                
            }
            
            if let evolDict = dict["evolutions"] as? [Dictionary<String,AnyObject>],evolDict.count > 0 {
                
                if let nextEvo = evolDict[0]["to"] as? String {
                    // checking condtion because mega's resources not available
                    if nextEvo.range(of: "mega") == nil {
                        self._nextEvolutionName = nextEvo
                        
                    }
                   
                }
                if let uri = evolDict[0]["resource_uri"] as? String {
                    
                    let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                    let nextEvolId = newStr.replacingOccurrences(of: "/", with: "")
                    self._nextEvolutionId = nextEvolId
                    
                }
                if let levelExist = evolDict[0]["level"] {
                    
                    if let level = levelExist as? Int {
                        self._nextEvolutionLvl = "\(level)"
                    }
                }
                else {
                    self._nextEvolutionLvl = ""
                }
            }
            
            }
         completed()   
        }
        
    }
    
}
