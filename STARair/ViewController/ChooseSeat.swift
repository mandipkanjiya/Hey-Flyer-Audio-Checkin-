//
//  ChooseSeat.swift
//  STARair
//
//  Created by Mandip Kanjiya on 30/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class ChooseSeat: UIViewController {

    @IBOutlet weak var viewSeats: UIViewX!
    @IBOutlet weak var viewBackSeats: UIViewX!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.roundCorners(view: viewSeats, corners: [.topLeft, .topRight], radius: 200)
        self.roundCorners(view: viewBackSeats, corners: [.topLeft,.topRight], radius: 200)
        
        // Do any additional setup after loading the view.
    }
    
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickPurchaseSeat(_ sender: Any) {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "Meals") as! Meals
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
