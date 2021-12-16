//
//  ExplainViewController.swift
//  tableTest
//
//  Created by max on 2021/12/16.
//

import UIKit

class ExplainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, quizModelProtocol {

    @IBOutlet weak var tableB: UITableView!
    
    var model = quizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    
    var firstGuy = ViewController()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        tableB.dataSource = self
        tableB.delegate = self
        
        model.delegate = self
        model.getQuestion()
        // Do any additional setup after loading the view.
        
    }
    
    func questionRetrieved(_ question: [Question]) {
        
        self.questions = question
        tableB.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard questions.count > 0 else {
            return 0
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        
        if currentQuestion.explain != nil {
            
            return currentQuestion.explain!.count
            
        }else{
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableB.dequeueReusableCell(withIdentifier: "ExplainCell", for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {

                let question = questions[currentQuestionIndex]
                if question.explain != nil && indexPath.row < question.explain!.count {

                    label!.text = question.explain![indexPath.row]

                }

            }

//        if firstGuy.indexNum == 0 {
//            if label != nil {
//
//                           let question = questions[currentQuestionIndex]
//                           if question.explain != nil && indexPath.row < question.explain!.count {
//
//                               label!.text = question.explain![indexPath.row]
//
//                           }
//
//                       }
//
//        }
//        else if firstGuy.indexNum == 1{
//                            let question = questions[currentQuestionIndex]
//                            if question.secondExplain != nil && indexPath.row < question.secondExplain!.count {
//
//                                label!.text = question.secondExplain![indexPath.row]
//
//                            }
//
//                        }
//
//
        
        return cell
  
    }
}
