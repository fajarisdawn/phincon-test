//
//  FetchAllRequest.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

struct FetchAllParameter: Codable {
    var offset: Int = 0
    var limit: Int = 40
    
    init(offset: Int) {
        self.offset = offset
    }
}
