//
//  QuizViewController.swift
//  collectionTest
//
//  Created by max on 2021/12/20.
//

import UIKit

protocol QuizModelProtocol{
    
    func questionRetrieved(_ question:[Question])
}

class QuizViewController: UIViewController {
    
    var delegate: QuizModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    getQuestions()
        // Do any additional setup after loading the view.
    }
    
    func getQuestions() {
        
        let path =  Bundle.main.path(forResource: "basicData", ofType: "json")
        
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
