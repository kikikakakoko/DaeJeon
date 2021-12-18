//
//  DetailViewController.swift
//  tableTest
//
//  Created by max on 2021/12/16.
//

import UIKit

class DetailViewController: UIViewController, quizModelProtocol {
   
    var model = quizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    

    @IBOutlet weak var detImage: UIImageView!
    
    @IBOutlet weak var detLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    func questionRetrieved(_ question: [Question]) {
        
        self.questions = question
        
        let currentQuestion = questions[currentQuestionIndex]
        
        detLabel.text = currentQuestion.detail
        
    }
    

}
