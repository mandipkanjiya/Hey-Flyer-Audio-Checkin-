//
//  FlightDetails.swift
//  STARair
//
//  Created by Mandip Kanjiya on 28/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class FlightDetails: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickChooseSeat(_ sender: Any) {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "Payment") as! Payment
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
