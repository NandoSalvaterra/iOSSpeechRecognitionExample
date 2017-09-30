//
//  AudioRecorder'.swift
//  iOSSpeechRecognitionExample
//
//  Created by Luiz Fernando Salvaterra on 30/09/17.
//  Copyright © 2017 Luiz Fernando Salvaterra. All rights reserved.
//

import Foundation
import AVKit

class AudioRecorder: NSObject, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    var audioSession: AVAudioSession!
    let recordSettings = [ AVSampleRateKey : NSNumber(value: Float(44100.0)),
                           AVFormatIDKey : NSNumber(value:Int32(kAudioFormatMPEG4AAC)),
                           AVNumberOfChannelsKey : NSNumber(value: Int32(1)),
                           AVEncoderAudioQualityKey :
                            NSNumber(value: Int32(AVAudioQuality.medium.rawValue))]
    
    func startRecord(file: String) -> URL {
        audioSession = AVAudioSession.sharedInstance()
        
        do {
           try audioSession.setActive(true)
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch {}
        
        var path = NSTemporaryDirectory() + "/" + file
        
        let url = URL(fileURLWithPath: path)
       
        do {
       try audioRecorder = AVAudioRecorder(url: url, settings: recordSettings)
            
        } catch {}
        audioRecorder.delegate = self
        
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        return url
        
    }
    
    
    func stopRecord() {
        audioRecorder.stop()
        
       try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("End of record.")
    }
}
