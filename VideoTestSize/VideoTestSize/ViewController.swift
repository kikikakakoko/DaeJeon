//
//  ViewController.swift
//  VideoTest
//
//  Created by max on 2021/12/28.
//
import AVKit
import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "game", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = testView.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        
        player.play()
        
    }
    

}


