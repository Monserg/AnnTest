//
//  Store.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 05.11.2020.
//

import UIKit

let storedValueKey: String = "storedValueKey"

struct Store: Codable {
    // MARK: - Properties
    let value: String?
    
    
    // MARK: - Functions
    static func create(text: String) {
        let store = Store(value: text)
        store.save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(self) {
            UserDefaults.standard.set(encoded, forKey: storedValueKey)
        }
    }
    
    static func load() -> Store? {
        if let savedStore = UserDefaults.standard.object(forKey: storedValueKey) as? Data {
            let decoder = JSONDecoder()
            
            if let loadedStore = try? decoder.decode(Store.self, from: savedStore) {
                return loadedStore
            }
        }
        
        return nil
    }
    
    static func loadStoredValue() -> String? {
        guard let store = Store.load() else { return nil }
            
        return store.value
    }
}
