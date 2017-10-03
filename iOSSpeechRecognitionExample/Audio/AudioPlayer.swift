//
//  AudioPlayer.swift
//  iOSSpeechRecognitionExample
//
//  Created by Luiz Fernando Salvaterra on 01/10/17.
//  Copyright © 2017 Luiz Fernando Salvaterra. All rights reserved.
//

import Foundation
import AVKit

class AudioPlayer: NSObject, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    
    func playAudio(with url: URL) {
        if player == nil {
            player  = try! AVAudioPlayer(contentsOf: url)
            player.delegate = self
            player.play()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
    }
    
}
