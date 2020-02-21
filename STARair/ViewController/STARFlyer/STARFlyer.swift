//
//  STARFlyer.swift
//  STARair
//
//  Created by Mandip Kanjiya on 31/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class STARFlyer: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblStarFlyer: UITableView!
    @IBOutlet weak var viewMiles: UIView!
    @IBOutlet weak var viewType: UIView!
    @IBOutlet weak var txtURL: UITextField!
    @IBOutlet weak var viewSettings: UIView!
    
    var arrDetails:NSArray = [["image":"ic_natural_place","title":"Spend now","desc":"Spend your STARFlyer Miles on exclusive offers with us and our global partners","status":"Exploer offers"],
                      ["image":"ic_family","title":"Earn now","desc":"Explore the many ways to earn STARFlyer Miles with us and global partners","status":"Exploer offers"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSettings(_ sender: Any) {
        self.viewSettings.isHidden = false
    }
    
    @IBAction func onClickSave(_ sender: Any) {
        
        if AppHelper.isNull(txtURL.text!) == true {
            AppHelper.showAlert("STARFlyer", message:"Please enter URL")
        }
        else {
            UserDefaults.standard.set(self.txtURL.text!, forKey: kURL)
            self.viewSettings.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "STARFlyerCell") as! STARFlyerCell
        let descDetails  = arrDetails.object(at: indexPath.row) as! NSDictionary
        cell.imgCell.image = UIImage(named: descDetails.object(forKey: "image") as! String)
        
        if let title = descDetails.object(forKey: "title") as? String {
            cell.lblTitle.text = title
        }
        
        if let desc = descDetails.object(forKey: "desc") as? String {
            cell.lblDesc.text = desc
        }
        
        if let status = descDetails.object(forKey: "status") as? String {
            cell.lblStatus.text = status
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
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
