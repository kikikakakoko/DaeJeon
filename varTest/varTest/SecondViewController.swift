//
//  SecondViewController.swift
//  varTest
//
//  Created by max on 2021/12/17.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    
    var secondNum = 0
    
    var firstBoy:ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        
        firstBoy = storyboard?.instantiateViewController(withIdentifier: "firstVC") as? ViewController
        
        secondLabel.text = String(ViewController.num)
        
        
    }
    
    @IBAction func Back(_ sender: Any) {
        
       
        present(firstBoy!, animated: true, completion: nil)
        
        
    }
    
    
}
