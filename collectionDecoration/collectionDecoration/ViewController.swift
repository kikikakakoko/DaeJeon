//
//  ViewController.swift
//  collectionDecoration
//
//  Created by max on 2021/12/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
        @IBOutlet weak var collectionView: UICollectionView!
    
    let model = CardModel()
    
    var cardsArray = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        cardsArray = model.getCards()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //get  the card from the cardArray
        let card = cardsArray[indexPath.row]
        
        // Configure it
        cell.configureCell(card: card)
        
        // Return it
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        
        
        
        // Get a reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // Check the status of the card to determine how to flip it
        if cell?.card?.isFlipped == false {
            cell?.flipUp(speed: 0.3)
        }
        else {
            cell?.flipDown(speed: 0.3)
        }
        cell?.playVideo()
        

    }
    
}

