//
//  Checkin.swift
//  STARair
//
//  Created by Mandip Kanjiya on 28/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit


class Checkin: UIViewController {
    @IBOutlet weak var btnAudioCheckIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickAudioCheckIn(_ sender: Any) {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "CheckinAudio") as! CheckinAudio
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
