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
    @IBOutlet weak var speechTextView: UITextView!
    
    var audioPlayer = AudioPlayer()
    let audioRecorder = AudioRecorder()
    var recordUrl: URL!
    var isRecording = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func requestSpeechAuthorization(for url: URL) {
        SFSpeechRecognizer.requestAuthorization { authenticationStatus in
            if authenticationStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                
                self.audioPlayer.playAudio(with: url)
                
                let recognizer = SFSpeechRecognizer()
                let request = SFSpeechURLRecognitionRequest(url: url)
                recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.speechTextView.text = result?.bestTranscription.formattedString
                    }
                })
            }
        }
    }
    
    @IBAction func record() {
        if isRecording {
            isRecording = false
            audioRecorder.stopRecord()
            requestSpeechAuthorization(for: recordUrl)
        } else {
            isRecording = true
            recordUrl =  self.audioRecorder.startRecord(file: "audio.caf")
        }
    }
}
