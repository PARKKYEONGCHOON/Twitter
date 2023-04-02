//
//  UserDefaultsManager.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/02.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getTwitt() -> [Twitt]
    func setTwitt(_ newValue: Twitt)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    
    enum Key: String {
        case twitt
        
        var value: String {
            self.rawValue
        }
    }
    
    func getTwitt() -> [Twitt] {
        guard let data = UserDefaults.standard.data(forKey: Key.twitt.value) else { return [] }
        
        return (try? PropertyListDecoder().decode([Twitt].self, from: data)) ?? []
    }
    
    func setTwitt(_ newValue: Twitt) {
        
        var currentTwitt: [Twitt] = getTwitt()
        
        currentTwitt.insert(newValue, at: 0)
        
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentTwitt), forKey: Key.twitt.value
        )
        
        
    }
    
}
