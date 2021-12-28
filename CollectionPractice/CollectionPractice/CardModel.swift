//
//  CardModel.swift
//  CollectionPractice
//
//  Created by max on 2021/12/29.
//

import Foundation

class CardModel {
    
    var randomNumber = 1
    func getCards() -> [Card] {
        
        //Declare en umpty array
        var generatedCards = [Card]()
        
        for _ in 1...14 {
            
            let cardOne = Card()
            
            cardOne.imageName = "card\(randomNumber)"
            
            generatedCards += [cardOne]
            randomNumber += 1
        }
        
        return generatedCards
        
    }

}
