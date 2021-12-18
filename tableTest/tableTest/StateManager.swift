//
//  StateManager.swift
//  tableTest
//
//  Created by max on 2021/12/17.
//

import Foundation
 
class StateManager {
    
    static var indexPathKey = "IndexPathKey"
    
    static func saveState(indexNum:Int) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(indexNum, forKey: indexPathKey)
        
    }
    
    
    static func retrieveValue(key:String) -> Any? {
        
        let defaults = UserDefaults.standard
        
        return defaults.value(forKey:key)
    }
    
    
    static func clearState() {
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: indexPathKey)
    }
    
    
    
}
