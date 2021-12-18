//
//  ViewController.swift
//  stateTest
//
//  Created by max on 2021/12/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    var currentNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = String(currentNum)
        // Do any additional setup after loading the view.
    }

    @IBAction func PlusButton(_ sender: Any) {
        
        currentNum += 1
        StateManager.saveState(varyingNum: currentNum)
        var savedNum = StateManager.retrieveValue(key: StateManager.superkey) as? Int
        testLabel.text = String(savedNum)
        
    }
    
}

