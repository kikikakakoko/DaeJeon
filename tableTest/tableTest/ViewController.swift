//
//  ViewController.swift
//  tableTest
//
//  Created by max on 2021/12/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, quizModelProtocol {
   
   
    var model = quizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    
    @IBOutlet weak var tableA: UITableView!
    
    var explainBoy:ExplainViewController?
    
    @IBOutlet weak var testlabel: UILabel!
    
      var indexNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        explainBoy = storyboard?.instantiateViewController(withIdentifier: "explainVC") as? ExplainViewController
       
        tableA.delegate = self
        tableA.dataSource = self
        
        model.delegate = self
        model.getQuestion()
        
        // Do any additional setup after loading the view.
    }
    
    func questionRetrieved(_ question: [Question]) {
        
        self.questions = question
        tableA.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard questions.count > 0 else {
            return 0
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        
        if currentQuestion.answer != nil {
            
            return currentQuestion.answer!.count
            
        }else{
            return 0
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableA.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {
            
            let question = questions[currentQuestionIndex]
            
            if question.answer != nil && indexPath.row < question.answer!.count {
                
                label!.text = question.answer![indexPath.row]
                
            }
            
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if explainBoy != nil {

                    present(explainBoy!, animated: true, completion: nil)

        }
        indexNum = indexPath.row
        
//        testlabel.text = String(indexNum)
        // 인덱스 패스의 조건에 따라 표시되는 테이블뷰의 indexPath.row값을 다르게 하자( explainView에서)
//        if indexPath.row < 1{
//        testlabel.text = "\(indexPath)"
//        }
        
    }


}

