//
//  Codable.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

extension Encodable {
    func encode() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                return [String: Any]()
            }
            return json
        } catch {
            return [String: Any]()
        }
    }
}

extension Data {
    func decode<T: Codable>(_ object: T) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            return nil
        }
        
    }
}
