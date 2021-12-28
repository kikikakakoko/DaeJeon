//
//  CardModel.swift
//  CollectionPractice
//
//  Created by max on 2021/12/29.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        //Declare en umpty array
        var generatedCards = [Card]()
        //Randomly generate 8 pairs of cards
        
        for _ in 1...14 {
            
            var theNumber = 1
            
            let cardOne = Card()
            
            cardOne.imageName = "card\(theNumber)"
            
            generatedCards += [cardOne]
            
            theNumber += 1
        }
        
        return generatedCards
        //Return the array
        
    }
    
}
