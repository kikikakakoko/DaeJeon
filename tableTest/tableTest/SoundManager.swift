//
//  SoundManager.swift
//  tableTest
//
//  Created by max on 2021/12/21.
//

import Foundation

import AVFoundation
 
class SoundManager {
    
    var audioPlayer:AVAudioPlayer?
    
    enum soundEffect{
        case flip
        case match
        case noMatch
        case shuffle
    }
    
    func playSound(effect:soundEffect) {
        
        var soundFileName = ""
        
        switch effect {
            
        case .flip:
            soundFileName = "cardflip"
        case .match:
            soundFileName = "dingcorrect"
        case .noMatch:
            soundFileName = "dingwrong"
        case .shuffle:
            soundFileName = "shuffle"
            
        }
        let bundlePath = Bundle.main.path(forResource: soundFileName , ofType: ".wav")
        
        guard bundlePath != nil else{
            return
            
        }
        let url = URL(fileURLWithPath: bundlePath!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch{
            return
        }
        
        
        
    }
    
}
