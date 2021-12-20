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
        
        if currentQuestion.plusVowel1 != nil {
            
            return currentQuestion.plusVowel1!.count
            
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
                           if question.plusVowel1 != nil && indexPath.row < question.plusVowel1!.count {

                               label!.text = question.plusVowel1![indexPath.row]

                           }

                       }

        }
        else if choosenRow == 1{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel2 != nil && indexPath.row < question.plusVowel2!.count {

                                label!.text = question.plusVowel2![indexPath.row]

                            }

                        }
        else if choosenRow == 2{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel3 != nil && indexPath.row < question.plusVowel3!.count {

                                label!.text = question.plusVowel3![indexPath.row]

                            }

                        }
        
        else if choosenRow == 3{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel4 != nil && indexPath.row < question.plusVowel4!.count {

                                label!.text = question.plusVowel4![indexPath.row]

                            }

                        }
        else if choosenRow == 4{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel5 != nil && indexPath.row < question.plusVowel5!.count {

                                label!.text = question.plusVowel5![indexPath.row]

                            }

                        }
        
        else if choosenRow == 5{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel6 != nil && indexPath.row < question.plusVowel6!.count {

                                label!.text = question.plusVowel6![indexPath.row]

                            }

                        }
        else if choosenRow == 6{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel7 != nil && indexPath.row < question.plusVowel7!.count {

                                label!.text = question.plusVowel7![indexPath.row]

                            }

                        }
        else if choosenRow == 7{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel8 != nil && indexPath.row < question.plusVowel8!.count {

                                label!.text = question.plusVowel8![indexPath.row]

                            }

                        }
        else if choosenRow == 8{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel9 != nil && indexPath.row < question.plusVowel9!.count {

                                label!.text = question.plusVowel9![indexPath.row]

                            }

                        }
        else if choosenRow == 9{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel10 != nil && indexPath.row < question.plusVowel10!.count {

                                label!.text = question.plusVowel10![indexPath.row]

                            }

                        }
        else if choosenRow == 10{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel11 != nil && indexPath.row < question.plusVowel11!.count {

                                label!.text = question.plusVowel11![indexPath.row]

                            }

                        }
        else if choosenRow == 11{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel12 != nil && indexPath.row < question.plusVowel12!.count {

                                label!.text = question.plusVowel12![indexPath.row]

                            }

                        }
        else if choosenRow == 12{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel13 != nil && indexPath.row < question.plusVowel13!.count {

                                label!.text = question.plusVowel13![indexPath.row]

                            }

                        }
        else if choosenRow == 13{
                            let question = questions[currentQuestionIndex]
                            if question.plusVowel14 != nil && indexPath.row < question.plusVowel14!.count {

                                label!.text = question.plusVowel14![indexPath.row]

                            }

                        }


        
        return cell
  
    }
   
    @IBAction func backButton(_ sender: Any) {
        
        present(firstBoy!, animated: true, completion: nil)
        
    }
}
