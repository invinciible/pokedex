//
//  PokemonDetailsVC.swift
//  pokedox
//
//  Created by Tushar Katyal on 07/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {

    var pokemon : Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriiptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokeDoxIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var mainImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ui update when view load
        nameLbl.text = pokemon.name.capitalized
        pokeDoxIdLbl.text = "\(pokemon.pokedoxId)"
        mainImg.image = UIImage(named: "\(pokemon.pokedoxId)")
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedoxId)")
        
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
    }
    // ui update from API
    func updateUI(){
        
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        descriiptionLbl.text = pokemon.description
        
        if pokemon.nextEvolId == "" {
            nextEvolutionLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        }else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolId)
        let str = "Next Evolution:\(pokemon.nextEvolName)-Level:\(pokemon.nextEvolLvl)"
        nextEvolutionLbl.text = str
        }
        
    }
   
    @IBAction func backBtn(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

}
