//
//  MyPokemonTableViewCell.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import UIKit


protocol MyPokemonTableViewCellInteractor {
    func rename(_ object: PokemonEntity)
}

class MyPokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var renameButton: UIButton!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var pokemon: PokemonEntity?
    var interactor: MyPokemonTableViewCellInteractor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ object: PokemonEntity) {
        self.pokemon = object
        self.pokemonImageView.loadImage(url: URL(string: object.originalImage()))
        if object.renameCount == 0 {
            self.pokemonNameLabel.text = object.nickname.capitalized
        } else {
            self.pokemonNameLabel.text = [object.nickname, "-" , "\(object.nicknameSuffix)"].joined().capitalized
        }
        
        
        renameButton.addTarget(self, action: #selector(renameButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc
    private func renameButtonTapped(_ sender: UIButton) {
        guard let object = self.pokemon else { return }
        interactor?.rename(object)
    }
    
}

extension MyPokemonTableViewCell: NibReusable {}
