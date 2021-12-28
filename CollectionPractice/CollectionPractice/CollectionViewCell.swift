//
//  CollectionViewCell.swift
//  CollectionPractice
//
//  Created by max on 2021/12/29.
//

import UIKit
import AVKit
import AVFoundation

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var movieView: UIView!
    var card:Card?
    
    func configureCell(card:Card)  {
        
        imageView.image = UIImage(named: card.imageName)
        
    }
    func playVideo() {
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "game", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = movieView.bounds
        layer.videoGravity = .resizeAspectFill
        movieView.layer.addSublayer(layer)
        
        player.play()
    }
    
    
}
