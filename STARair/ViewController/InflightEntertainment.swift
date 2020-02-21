//
//  InflightEntertainment.swift
//  STARair
//
//  Created by Mandip Kanjiya on 30/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit
import WebKit

class InflightEntertainment: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        var stringUrl = ""
        
        if UserDefaults.standard.object(forKey: kURL) != nil {
            stringUrl = UserDefaults.standard.object(forKey: kURL) as! String
            let myURL = URL(string: stringUrl) // "https://www.google.com"
            let myRequest = URLRequest(url: myURL!)
            webView.loadRequest(myRequest)
        }
        else {
            AppHelper.showAlert("STARFlyer", message: "Please set url of Inflight")
        }
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
