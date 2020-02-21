//
//  Manage.swift
//  STARair
//
//  Created by Mandip Kanjiya on 29/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class Manage: UIViewController {

    @IBOutlet weak var viewFirst: UIViewX!
    @IBOutlet weak var viewSecond: UIViewX!
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTap = UITapGestureRecognizer(target: self, action: #selector(openCheckin))
        firstTap.numberOfTapsRequired = 1
        viewFirst.isUserInteractionEnabled = true
        viewFirst.addGestureRecognizer(firstTap)
        
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(openCheckin))
        secondTap.numberOfTapsRequired = 1
        viewSecond.isUserInteractionEnabled = true
        viewSecond.addGestureRecognizer(secondTap)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func openCheckin() {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "Checkin") as! Checkin
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    

    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
