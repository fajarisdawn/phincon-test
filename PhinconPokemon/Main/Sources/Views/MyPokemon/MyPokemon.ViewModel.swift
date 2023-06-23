//
//  MyPokemon.ViewModel.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import Foundation

protocol InternalMyPokemonInteractor {
    func successFetchData()
    func deleteData()
    func successRename()
}

class MyPokemonViewModel {
    var pokemons: [PokemonEntity]
    var pokemon: PokemonEntity?
    var interactor: InternalMyPokemonInteractor?
    
    init() {
        self.pokemons = Storage.fetch(PokemonEntity.self)
        interactor?.successFetchData()
    }
    
    func delete(_ object: PokemonEntity) {
        Storage.delete("\(object.id)")
        self.pokemons = Storage.fetch(PokemonEntity.self)
        interactor?.deleteData()
    }
    
    func rename(_ object: PokemonEntity) {
        pokemon = object
        pokemon?.nicknameSuffix = Fibonacci.calculate(num: object.renameCount)
        pokemon?.renameCount = object.renameCount + 1
        Storage.save(self.pokemon, name: "\(object.id)")
        pokemons = Storage.fetch(PokemonEntity.self)
        interactor?.successRename()
    }
}
