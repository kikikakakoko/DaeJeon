//
//  ViewController.swift
//  CrazyKorean
//
//  Created by max on 2021/12/15.
//

import UIKit



class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
  
    var sonBoy = Son()
    @IBOutlet weak var sonCollection: UICollectionView!
    
    @IBOutlet weak var sonLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sonCollection.dataSource = self
        sonCollection.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sonBoy.sonLetter.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = sonCollection.dequeueReusableCell(withReuseIdentifier: "SonCell", for: indexPath)
        
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let sonCell = cell as? sonCollectionCell

        sonCell?.configureCell()
        
    }

}

