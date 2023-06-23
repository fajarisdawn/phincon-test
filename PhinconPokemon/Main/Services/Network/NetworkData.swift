//
//  APIData.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

struct NetworkData {
    fileprivate var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

extension NetworkData {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        do {
            let jsonDecoder = JSONDecoder()
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            return nil
        }
    }
}
