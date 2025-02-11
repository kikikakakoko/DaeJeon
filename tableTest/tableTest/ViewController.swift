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

    var indexNum = 0
    static var choosenRow:Int?
    
   
    
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
        
        if currentQuestion.consnants != nil {
            
            return currentQuestion.consnants!.count
            
        }else{
            return 0
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableA.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {
            
            let question = questions[currentQuestionIndex]
            
            if question.consnants != nil && indexPath.row < question.consnants!.count {
                
                label!.text = question.consnants![indexPath.row]
                
            }
            
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if explainBoy != nil {

                    present(explainBoy!, animated: true, completion: nil)

        }
       

//        explainBoy?.choosenRow = tableA.indexPathForSelectedRow?.row //계속 0이나오는 이유 1,2,3...이 나와야....
//        var choosenRow = tableA.indexPathForSelectedRow
//        indexNum = indexPath.row
       
       
         ViewController.choosenRow = tableA.indexPathForSelectedRow?.row
        
        let theNum = ViewController.choosenRow! as Int
        
        StateManager.saveState(indexNum: theNum)
        
        
        
        
        

//        let selectedNum = tableA.indexPathForSelectedRow
//        testlabel.text = String(indexNum)
        
//       StateManager.saveState(indexNum: indexNum)
//        let savedNum = StateManager.retrieveValue(key: StateManager.indexPathKey) as? Int
//        testlabel.text = String(indexNum)
        
        
        
        // 인덱스 패스의 조건에 따라 표시되는 테이블뷰의 indexPath.row값을 다르게 하자( explainView에서)
//        if indexPath.row < 1{
//        testlabel.text = "\(indexPath)"
//        }
        
    }


}

