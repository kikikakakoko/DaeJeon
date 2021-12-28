//
//  ViewController.swift
//  CollectionPractice
//
//  Created by max on 2021/12/29.
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CollectionViewCell
        
        let card = cardsArray[indexPath.row]
        
        cell.configureCell(card: card)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Get a reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell

        //TODO: 이미지뷰를 안보이게 해야한다.
        cell?.imageView.alpha = 0
        
        cell?.playVideo()
        
    }

}

