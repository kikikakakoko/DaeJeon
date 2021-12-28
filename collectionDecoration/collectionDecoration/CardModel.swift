//
//  CardModel.swift
//  collectionDecoration
//
//  Created by max on 2021/12/21.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        //Declare en umpty array
        var generatedCards = [Card]()
        //Randomly generate 8 pairs of cards
        
        for _ in 1...8 {
            
            var randomNumber = Int.random(in: 1...13)
            
            let cardOne = Card()
            let cardTwo = Card()
            
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCards += [cardOne, cardTwo]
        }
        //Randomize the cards within the array
        generatedCards.shuffle()
        
        return generatedCards
        //Return the array
        
    }
    
}
