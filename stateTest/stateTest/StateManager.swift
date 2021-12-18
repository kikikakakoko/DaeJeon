//
//  StateManager.swift
//  stateTest
//
//  Created by max on 2021/12/17.
//

import Foundation

class StateManager {
    
    static var superkey = "RealKey"
    
    static func saveState(varyingNum: Int) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(varyingNum, forKey: superkey)
        
    }
    
    static func retrieveValue(key: String) -> Any {
        
        let defaults = UserDefaults.standard
        
        return defaults.value(forKey: key)
        
    }
    
    static func clearState() {
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: superkey)
        
    }
    
    
    
}
