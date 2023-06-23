//
//  NetworkUseCase.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

protocol NetworkUseCase {
    var network: Network { get set }
    func fetchAll(parameter: FetchAllParameter)
    func fetch(parameter: FetchParameter)
}

extension NetworkUseCase {
    func fetchAll(parameter: FetchAllParameter) {
        network.task(network: .fetchAll(parameter: parameter), type: PokemonListEntity.self, method: .get)
    }
    
    func fetch(parameter: FetchParameter) {
        network.task(network: .fetch(parameter: parameter), type: PokemonEntity.self, method: .get)
    }
    
//    func searchBusinesses(parameter: SearchBusinessesParameter) {
//        networkService.task(network: .searchBusinesses(parameter: parameter), type: SearchBusinessesResponse.self)
//    }
//
//    func getBusiness(id: String) {
//        networkService.task(network: .getBusiness(id: id), type: SearchBusinessesResponse.Business.self)
//    }
//
//    func getReviews(id: String) {
//        networkService.task(network: .getReviews(id: id), type: ReviewResponse.self)
//    }
}


