//
//  Storage.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import Foundation

class Storage {
    static func save<T: Codable>(_ object: T, name: String) {
        let defaults = UserDefaults()
        let data = try? JSONEncoder().encode(object)
        defaults.set(data, forKey: [name, "-pokemon"].joined())
    }
    
    static func fetch<T: Decodable>(_ object: T.Type, name: String) -> T? {
        let defaults = UserDefaults()
        guard let encodedData = defaults.data(forKey: name) else {
            return nil
        }
        
        return try! JSONDecoder().decode(object, from: encodedData)
    }
    
    static func fetch<T: Codable>(_ object: T.Type) -> [T] {
        var result: [T] = []
        let objects = UserDefaults.standard.dictionaryRepresentation().keys
        
        objects.forEach { (item) in
            if item.contains("-pokemon") {
                guard let object = fetch(object, name: item) else { return }
                result.append(object)
            }
        }
        return result
    }
        
    
    static func delete(_ name: String) {
        let defaults = UserDefaults()
        defaults.removeObject(forKey: [name, "-pokemon"].joined())
    }
    
    static func delete() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
}
