//
//  Network.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

protocol EndpointType {
    var baseUrl: URL { get }
    var path: String { get }
}

enum NetworkAPI {
    case none
    case fetchAll(parameter: FetchAllParameter)
    case fetch(parameter: FetchParameter)
}

extension NetworkAPI: EndpointType {
    var baseUrl: URL {
        return URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    var path: String {
        switch self {
            case .fetchAll(let request):
                return "pokemon?\(request.encode().toQueryString())"
            case .fetch(let request):
                return "pokemon/\(request.name)"
        default:
            return ""
        }
    }
}
