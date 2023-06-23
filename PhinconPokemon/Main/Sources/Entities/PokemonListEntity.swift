//
//  PokemonList.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

struct PokemonListEntity: Codable {
    let count: Int
    let next, previous: String
    var results: [Result]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count) ?? 0
        self.next = try container.decodeIfPresent(String.self, forKey: .next) ?? ""
        self.previous = try container.decodeIfPresent(String.self, forKey: .previous) ?? ""
        self.results = try container.decodeIfPresent([Result].self, forKey: .results) ?? []
    }
    
    // MARK: - Result
    struct Result: Codable {
        let name: String
        let url: String
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
            self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        }
        
        func getoriginalImage() -> String {
            let pokemonId = Int("\(url.replacingOccurrences(of:"https://pokeapi.co/api/v2/pokemon/", with: "").dropLast())")
            let pathUrl = String(format: "%03d", pokemonId ?? 0)
            return "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/\(pathUrl).png"
        }
    }
}
