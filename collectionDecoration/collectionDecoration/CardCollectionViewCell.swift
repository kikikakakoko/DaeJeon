//
//  CardCollectionViewCell.swift
//  collectionDecoration
//
//  Created by max on 2021/12/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func configureCell(card:Card) {
        
        // Keep track of the card that this cell represent
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
        
        // Reset the card
        if card.isFlipped == true {
            flipUp(speed: 0)
        }
        else {
            flipDown(speed: 0)
        }
        
        
        
    }
    func flipUp(speed:TimeInterval = 0.3) {
        
        // Flip the card
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        // Set the status of the card
        card?.isFlipped = true
        
    }
    func flipDown(speed: TimeInterval = 0.3) {
        
        UIView.transition(from: frontImageView, to: backImageView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        card?.isMatched = false
        
    }
    
}
