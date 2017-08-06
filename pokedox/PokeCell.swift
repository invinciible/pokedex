//
//  PokeCell.swift
//  pokedox
//
//  Created by Tushar Katyal on 06/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
// custom uiview cell for pokemon

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeNameLbl : UILabel!
    @IBOutlet weak var pokeThumbImg : UIImageView!
    
    var pokemon : Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon : Pokemon){
        self.pokemon = pokemon
        
        pokeNameLbl.text = self.pokemon.name
        
        pokeThumbImg.image = UIImage(named: "\(self.pokemon.pokedoxId)" )
    }
    
    
}
