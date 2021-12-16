//
//  LetterModel.swift
//  CrazyKorean
//
//  Created by max on 2021/12/15.
//

import Foundation

protocol LetterModelProtocol{
    
    func letterRetrieved(_ son:[Son])
    
}

class LetterModel {
    
    var delegate:LetterModelProtocol?
    
    func getLetters() {
        
        let path = Bundle.main.path(forResource: "LetterData", ofType: "json")
        
        guard path != nil else {
            return
        }
        let url = URL(fileURLWithPath: path!)
        
        do{
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            let array = try decoder.decode([Son].self, from: data)
            
            delegate?.letterRetrieved(array)
        }
        catch{
            
        }
        
        
        
        
    }
    
}
