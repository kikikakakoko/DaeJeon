//
//  CardCollectionViewCell.swift
//  collectionDecoration
//
//  Created by max on 2021/12/22.
//

import UIKit
import AVKit
import AVFoundation

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    @IBOutlet weak var testView: UIView!
    func configureCell(card:Card) {
        
        // Plus AVPlayer
        // TODO: 1.facilitating the size of the cell. 2. 동영상파일 지우고 그림파일이 표시되게하기
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "game", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = testView.bounds
        layer.videoGravity = .resizeAspectFill
        testView.layer.addSublayer(layer)
        
        player.play()
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
    func playVideo() {

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "game", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = testView.bounds
        layer.videoGravity = .resizeAspectFill
        testView.layer.addSublayer(layer)

        player.play()
    }
    
    
}
