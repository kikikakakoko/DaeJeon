//
//  ExplainViewController.swift
//  tableTest
//
//  Created by max on 2021/12/16.
//

import UIKit

class ExplainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, quizModelProtocol {

    @IBOutlet weak var tableB: UITableView!
    
    var firstBoy:ViewController?
    
    var model = quizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    
    var firstGuy = ViewController()
    var choosenRow = 0
   
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstBoy = storyboard?.instantiateViewController(withIdentifier: "firstVC") as? ViewController

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
        
//        if label != nil {
//
//                let question = questions[currentQuestionIndex]
//                if question.explain != nil && indexPath.row < question.explain!.count {
//
//                    label!.text = question.explain![indexPath.row]
//
//                }
//
//            }
//
//        var indexNum = StateManager.retrieveValue(key: StateManager.indexPathKey)
        let theRowNum = StateManager.retrieveValue(key: StateManager.indexPathKey) as? Int
        
        if theRowNum != nil {
            
            choosenRow = theRowNum!
            testLabel.text = String(choosenRow)
        }
        
        
        // 뷰컨트롤러에서 변화된 indexNum의 값이 왜 여기선 안변하지?.   stateManager를 공부해보자
        if choosenRow == 0 {
            if label != nil {

                           let question = questions[currentQuestionIndex]
                           if question.explain != nil && indexPath.row < question.explain!.count {

                               label!.text = question.explain![indexPath.row]

                           }

                       }

        }
        else if choosenRow == 1{
                            let question = questions[currentQuestionIndex]
                            if question.secondExplain != nil && indexPath.row < question.secondExplain!.count {

                                label!.text = question.secondExplain![indexPath.row]

                            }

                        }
//
//
        
        return cell
  
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        present(firstBoy!, animated: true, completion: nil)
        
    }
}
