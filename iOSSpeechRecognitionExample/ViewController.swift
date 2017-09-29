//
//  ViewController.swift
//  iOSSpeechRecognitionExample
//
//  Created by Luiz Fernando Salvaterra on 28/09/17.
//  Copyright © 2017 Luiz Fernando Salvaterra. All rights reserved.
//

import UIKit
import Speech
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authenticationStatus in
            if authenticationStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                let audioUrl  = Bundle.main.url(forResource: "audio", withExtension: "m4a")!
                do {
                    let sound = try! AVAudioPlayer(contentsOf: audioUrl)
                    self.audioPlayer = sound
                    sound.play()
                } catch {
                    print("Error")
                }
                
                let recognizer = SFSpeechRecognizer()
                let request = SFSpeechURLRecognitionRequest(url: audioUrl)
                recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                    if let error = error {
                        print(error)
                    } else {
                        print(result?.bestTranscription.formattedString)
                    }
                })
            }
        }
    }
    
    @IBAction func test() {
        requestSpeechAuthorization()
    }
    
    
}

