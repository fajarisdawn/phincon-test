//
//  Home.ViewModel.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

protocol HomeViewModelConstructor {
    
}

class HomeViewModel: NetworkUseCase {
    var network: Network
    var parameter: FetchAllParameter?
    var interactor: ViewModelInteractor?
    var pokemonsTemp: PokemonListEntity?
    
    private var pokemons: PokemonListEntity?
    private var offset = 0
    var nextPage: Bool = false
    
    init(){
        network = Network()
        network.interactor = self
        parameter = FetchAllParameter(offset: offset)
    }
    
    func fetchAll() {
        guard let `parameter` = self.parameter else { return }
        fetchAll(parameter: parameter)
    }
    
    func loadMore() {
        self.parameter = FetchAllParameter(offset: offset)
        fetchAll()
    }
}

extension HomeViewModel: NetworkInteractor {
    func success(_ object: Codable, network: NetworkAPI) {
        self.pokemons = object as? PokemonListEntity
        if nextPage {
            guard let `pokemons` = pokemons else { return }
            self.pokemonsTemp?.results.append(contentsOf: pokemons.results)
            self.offset += pokemons.results.count
        } else {
            self.offset = self.pokemons?.results.count ?? 0
            self.pokemonsTemp = self.pokemons
            self.nextPage = true
        }
        
        interactor?.success(network)
    }
    
    func failed(_ message: String, network: NetworkAPI) {
        interactor?.failed(message)
    }
}
