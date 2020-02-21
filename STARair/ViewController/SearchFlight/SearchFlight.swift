//
//  SearchFlight.swift
//  STARair
//
//  Created by Mandip Kanjiya on 27/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class SearchFlight: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblSearchTitle: UILabel!
    @IBOutlet weak var viewOneWay: UIViewX!
    @IBOutlet weak var lblOneWay: UILabel!
    @IBOutlet weak var viewRoundTrip: UIViewX!
    @IBOutlet weak var lblRoundTrip: UILabel!
    @IBOutlet weak var btnSearchFlight: UIButtonX!
    @IBOutlet weak var heightView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        heightView.constant = 1500 - self.view.frame.size.height
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickSearchFlight(_ sender: Any) {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "SearchResult") as! SearchResult
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
