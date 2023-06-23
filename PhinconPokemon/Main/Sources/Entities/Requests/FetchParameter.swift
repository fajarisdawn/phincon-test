//
//  FetchParameter.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

struct FetchParameter: Codable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
