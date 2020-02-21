//
//  BoardingPass.swift
//  STARair
//
//  Created by Mandip Kanjiya on 29/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit
import AVFoundation

class BoardingPass: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        do {
            if let fileURL = Bundle.main.path(forResource: "thankyou", ofType: "mp3") {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
