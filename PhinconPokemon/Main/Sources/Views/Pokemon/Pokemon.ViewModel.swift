//
//  Pokemon.ViewModel.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import Foundation

protocol PokemonViewModelInteractor {
    func successSave()
}

class PokemonViewModel: NetworkUseCase {
    var network: Network
    var parameter: FetchParameter?
    var pokemonResultEntity: PokemonListEntity.Result?
    var pokemon: PokemonEntity?
    var interactor: ViewModelInteractor?
    var internalInteractor: PokemonViewModelInteractor?
    
    init(_ object: PokemonListEntity.Result) {
        network = Network()
        network.interactor = self
        parameter = FetchParameter(name: object.name)
        self.pokemonResultEntity = object
    }
    
    func get() {
        guard let `parameter` = parameter else { return }
        fetch(parameter: parameter)
    }
    
    func savePokemon(_ nickname: String) {
        self.pokemon?.nickname = nickname
        guard let object = self.pokemon else { return }
        self.pokemon?.nicknameSuffix = Fibonacci.calculate(num: object.renameCount)
        Storage.save(self.pokemon, name: String(describing: object.id))
        internalInteractor?.successSave()
    }
    
}

extension PokemonViewModel: NetworkInteractor {
    func success(_ object: Codable, network: NetworkAPI) {
        guard let `object` = object as? PokemonEntity else { return }
        self.pokemon = object
        interactor?.success(network)
    }
    
    func failed(_ message: String, network: NetworkAPI) {
        interactor?.failed(message)
    }
    
    
}
