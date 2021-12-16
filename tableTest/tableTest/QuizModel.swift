//
//  QuizModel.swift
//  tableTest
//
//  Created by max on 2021/12/16.
//

import Foundation

protocol quizModelProtocol{
    
        func questionRetrieved(_ question: [Question])
    
}

class quizModel {
    
    var delegate:quizModelProtocol?
    
    func getQuestion() {
        
        let path = Bundle.main.path(forResource: "QuestionData", ofType: "json")
        
        guard path != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            let array = try decoder.decode([Question].self, from: data)
            
            delegate?.questionRetrieved(array)
            
        }
        catch{
            
        }
        
        
        
        
    }
    
    
}
