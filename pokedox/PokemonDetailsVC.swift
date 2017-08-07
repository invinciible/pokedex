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

        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
    }

    func updateUI(){
        
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        nameLbl.text = pokemon.name.capitalized
        pokeDoxIdLbl.text = "\(pokemon.pokedoxId)"
        mainImg.image = UIImage(named: "\(pokemon.pokedoxId)")
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedoxId)")
    }
   
    @IBAction func backBtn(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

}
