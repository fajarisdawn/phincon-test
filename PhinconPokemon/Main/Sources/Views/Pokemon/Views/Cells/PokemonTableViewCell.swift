//
//  PokemonTableViewCell.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import UIKit
import SkeletonView

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var ablilityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ object: PokemonEntity.Ability) {
        self.ablilityName.text = object.ability?.name
    }
    
}

extension PokemonTableViewCell: NibReusable {}
