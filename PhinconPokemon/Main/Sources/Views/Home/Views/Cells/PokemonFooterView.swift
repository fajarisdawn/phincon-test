//
//  PokemonFooterView.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import UIKit
import NVActivityIndicatorView

class PokemonFooterView: UICollectionReusableView {

    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    var isAnimating: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure(){
        indicatorView.type = .circleStrokeSpin
        indicatorView.color = .darkGray
        indicatorView.startAnimating()
    }
    
    func animateFinal() {
        if isAnimating {
            return
        }
        isAnimating = true
    }
}

extension PokemonFooterView: NibReusable {}
