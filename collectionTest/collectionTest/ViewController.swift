//
//  ViewController.swift
//  collectionTest
//
//  Created by max on 2021/12/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, QuizModelProtocol {
    
    
   
    var question = [Question]()
    var currentConsnantIndex = 0
    var model = QuizViewController()

    @IBOutlet weak var collectionA: UICollectionView!
    @IBOutlet weak var basicLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionA.delegate = self
        collectionA.dataSource = self
        
        model.delegate = self
        model.getQuestions()
        
    }
    
    func questionRetrieved(_ question: [Question]) {
        
        self.question = question
        collectionA.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        guard question.count > 0 else {
            return 0
        }
        
        
        
        let currentCons = question[currentConsnantIndex]
        
        
        if currentCons.consnants != nil {
            
        return currentCons.consnants!.count
            
        }
        else
        {
           return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionA.dequeueReusableCell(withReuseIdentifier: "consnantCell", for: indexPath) 
        
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {
            
            let question = question[currentConsnantIndex]
            
            if question.consnants != nil && indexPath.row < question.consnants!.count{
                
                label!.text = question.consnants![indexPath.row]
            }
            
        }
        
        return cell
    }

}

