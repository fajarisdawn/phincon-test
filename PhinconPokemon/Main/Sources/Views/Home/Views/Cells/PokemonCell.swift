//
//  PokemonCell.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import UIKit
import SkeletonView

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ object: PokemonListEntity.Result) {
        self.pokemonNameLabel.text = object.name.capitalized
        self.pokemonImageView.loadImage(url: URL(string: object.getoriginalImage()))
    }
}

extension PokemonCell: NibReusable {}
