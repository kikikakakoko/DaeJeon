//
//  ViewController.swift
//  varTest
//
//  Created by max on 2021/12/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Tlabel: UILabel!
    
    var secondBoy:SecondViewController?
    
    static var num = 0
    
    var aNum = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondBoy = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController
        
        // Do any additional setup after loading the view.
    }

    @IBAction func pButton(_ sender: Any) {
        
        ViewController.num += 1
        
//        Tlabel.text = String(ViewController.num)
        StateMan.saveData(theNum: ViewController.num)
        
        let savedNum = StateMan.retrievData(key: StateMan.goodKey) as? Int
        
        aNum = savedNum!
        
        
        
        Tlabel.text = String(aNum)

        
    }
    
    @IBAction func nestButton(_ sender: Any) {
       
        present(secondBoy!, animated: true, completion: nil)
        
    }
    
    
}

