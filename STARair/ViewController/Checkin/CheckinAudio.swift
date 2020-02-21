//
//  CheckinAudio.swift
//  STARair
//
//  Created by Mandip Kanjiya on 28/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class CheckinAudio: UIViewController, SFSpeechRecognizerDelegate {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnAudio: UIButton!
    @IBOutlet weak var viewProcessing: UIViewX!
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isRecording = false
    var speakingText = ""
    var isAccepted = false
    var audioPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestSpeechAuthorization()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickAudio(_ sender: Any) {
        if isRecording == true {
            audioEngine.stop()
            recognitionTask?.cancel()
            isRecording = false
            btnAudio.setImage(UIImage(named: "ic_micro_white"), for: .normal)
            btnAudio.isEnabled = true
        } else {
            self.recordAndRecognizeSpeech()
            isRecording = true
            speakingText = ""
            isAccepted = false
            btnAudio.isEnabled = false
            btnAudio.setImage(UIImage(named: "ic_micro_gray"), for: .normal)
            btnAudio.tintColor = UIColor.gray
        }
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Recognize Speech
    
    func recordAndRecognizeSpeech() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
//            self.sendAlert(message: "There has been an audio engine error.")
            return print(error)
        }
        guard let myRecognizer = SFSpeechRecognizer() else {
            //self.sendAlert(message: "Speech recognition is not supported for your current locale.")
            return
        }
        if !myRecognizer.isAvailable {
//            self.sendAlert(message: "Speech recognition is not currently available. Check back at a later time.")
            // Recognizer is not available right now
            return
        }
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
            if let result = result {
                
                let bestString = result.bestTranscription.formattedString
               // self.detectedTextLabel.text = bestString
                
                var lastString: String = ""
                for segment in result.bestTranscription.segments {
                    let indexTo = bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
                    lastString = bestString.substring(from: indexTo)
                }
                self.checkForColorsSaid(resultString: lastString)
            } else if let error = error {
                self.sendAlert(message: "There has been a speech recognition error.")
                print(error)
            }
        })
    }
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.btnAudio.isEnabled = true
                case .denied:
                    self.btnAudio.isEnabled = false
                    print("User denied access to speech recognition")
//                    self.detectedTextLabel.text = "User denied access to speech recognition"
                case .restricted:
                    self.btnAudio.isEnabled = false
                    print("Speech recognition restricted on this device")
//                    self.detectedTextLabel.text = "Speech recognition restricted on this device"
                case .notDetermined:
                    self.btnAudio.isEnabled = false
                    print("Speech recognition not yet authorized")
//                    self.detectedTextLabel.text = "Speech recognition not yet authorized"
                }
            }
        }
    }
    
    @objc func playAudio() {
        viewProcessing.isHidden = true
        do {
            if let fileURL = Bundle.main.path(forResource: "prohibitedAudio", ofType: "mp3") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                audioPlayer?.play()
                audioPlayer?.numberOfLoops = 0
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
    }
    
    @objc func callReset() {
        speakingText = ""
        isRecording = false
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionTask?.finish()
        isAccepted = true
        btnAudio.setImage(UIImage(named: "ic_micro_white"), for: .normal)
        btnAudio.isEnabled = true
    }
    
    func checkForColorsSaid(resultString: String) {
        
        if isAccepted == false {
            speakingText = (speakingText + " " + resultString).trimmingCharacters(in: .whitespacesAndNewlines)
            print(speakingText)
        }

        switch speakingText {
        case "Hey flyer can you please check in":
            print("Yes Processing...")
            viewProcessing.isHidden = false
            speakingText = ""
            isRecording = false
            audioEngine.inputNode.removeTap(onBus: 0)
            recognitionTask?.finish()
            isAccepted = true
            perform(#selector(playAudio), with: nil, afterDelay: 5.0)
            btnAudio.setImage(UIImage(named: "ic_micro_white"), for: .normal)
            btnAudio.isEnabled = true
            break
        case "No":
            print("done....")
            speakingText = ""
            isRecording = false
            audioEngine.inputNode.removeTap(onBus: 0)
            recognitionTask?.finish()
            btnAudio.setImage(UIImage(named: "ic_micro_white"), for: .normal)
            isAccepted = true
            btnAudio.isEnabled = true
            let nextViewController = objMain.instantiateViewController(withIdentifier: "BoardingPass") as! BoardingPass
            self.navigationController?.pushViewController(nextViewController, animated: true)
            break;
            
        default:
            perform(#selector(callReset), with: nil, afterDelay: 5.0)
            break
        }
    }
    
    func sendAlert(message: String) {
        let alert = UIAlertController(title: "Speech Recognizer Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
