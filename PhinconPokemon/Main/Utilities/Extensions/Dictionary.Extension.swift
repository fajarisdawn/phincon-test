//
//  Dictionary.Extension.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

extension Dictionary {
    func toQueryString() -> String {
        var queryString: String = ""
        for (key,value) in self {
            queryString += "\(key)=\(value)&"
        }
        return String(queryString)
    }
}
