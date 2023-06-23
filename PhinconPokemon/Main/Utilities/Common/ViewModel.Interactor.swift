//
//  ViewModelInteractor.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

protocol ViewModelInteractor {
    func success(_ network: NetworkAPI)
    func failed(_ message: String)
}
