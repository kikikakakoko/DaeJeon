//
//  StateMan.swift
//  varTest
//
//  Created by max on 2021/12/17.
//

import Foundation

class StateMan {
    
    static var goodKey = "rightKey"
    
    static func saveData (theNum: Int) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(theNum, forKey: goodKey)
        
    }
    static func retrievData(key: String) -> Any? {
        
        let defaults = UserDefaults.standard
        
        return defaults.value(forKey: key)
          
    }
    
    static func clearState() {
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: goodKey)
        
    }
    
    
    
    
}
